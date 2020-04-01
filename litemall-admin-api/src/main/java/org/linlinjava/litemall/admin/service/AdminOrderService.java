package org.linlinjava.litemall.admin.service;

import com.github.binarywang.wxpay.bean.request.WxPayRefundRequest;
import com.github.binarywang.wxpay.bean.result.WxPayRefundResult;
import com.github.binarywang.wxpay.exception.WxPayException;
import com.github.binarywang.wxpay.service.WxPayService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.linlinjava.litemall.core.notify.NotifyService;
import org.linlinjava.litemall.core.notify.NotifyType;
import org.linlinjava.litemall.core.util.JacksonUtil;
import org.linlinjava.litemall.core.util.ResponseUtil;
import org.linlinjava.litemall.db.domain.LitemallComment;
import org.linlinjava.litemall.db.domain.LitemallOrder;
import org.linlinjava.litemall.db.domain.LitemallOrderGoods;
import org.linlinjava.litemall.db.domain.UserVo;
import org.linlinjava.litemall.db.service.*;
import org.linlinjava.litemall.db.util.OrderUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.linlinjava.litemall.admin.util.AdminResponseCode.*;

@Service

public class AdminOrderService {
    private final Log logger = LogFactory.getLog(AdminOrderService.class);

    @Autowired
    private LitemallOrderGoodsService orderGoodsService;
    @Autowired
    private LitemallOrderService orderService;
    @Autowired
    private LitemallGoodsProductService productService;
    @Autowired
    private LitemallUserService userService;
    @Autowired
    private LitemallCommentService commentService;
    @Autowired
    private WxPayService wxPayService;
    @Autowired
    private NotifyService notifyService;
    @Autowired
    private LogHelper logHelper;

    public Object list(Integer userId, String orderSn, LocalDateTime start, LocalDateTime end, List<Short> orderStatusArray,
                       Integer page, Integer limit, String sort, String order) {
        List<LitemallOrder> orderList = orderService.querySelective(userId, orderSn, start, end, orderStatusArray, page, limit,
                sort, order);
        return ResponseUtil.okList(orderList);
    }

    public Object detail(Integer id) {
        LitemallOrder order = orderService.findById(id);
        List<LitemallOrderGoods> orderGoods = orderGoodsService.queryByOid(id);
        UserVo user = userService.findUserVoById(order.getUserId());
        Map<String, Object> data = new HashMap<>();
        data.put("order", order);
        data.put("orderGoods", orderGoods);
        data.put("user", user);

        return ResponseUtil.ok(data);
    }

    /**
     * Order refund
     * <p>
     * 1. Check whether the current order can be refunded;
     * 2. WeChat refund operation;
     * 3. Set order refund confirmation status;
     * 4. The merchandise inventory of the order is returned to the warehouse.
     * <p>
     * TODO
     * Although the WeChat refund API is connected, from a security point of view, it is recommended that developers delete the WeChat refund code here and take the following two steps:
     * 1. The administrator logs in to the WeChat official payment platform and clicks the refund operation to refund
     * 2. The administrator logs in to the litemall management background and clicks the refund operation to modify the order status and return the product inventory to the library
     *
     * @param body order information, {orderId: xxx}
     * @return order refund operation result
     *      
     */
    @Transactional
    public Object refund(String body) {
        Integer orderId = JacksonUtil.parseInteger(body, "orderId");
        String refundMoney = JacksonUtil.parseString(body, "refundMoney");
        if (orderId == null) {
            return ResponseUtil.badArgument();
        }
        if (StringUtils.isEmpty(refundMoney)) {
            return ResponseUtil.badArgument();
        }

        LitemallOrder order = orderService.findById(orderId);
        if (order == null) {
            return ResponseUtil.badArgument();
        }

        if (order.getActualPrice().compareTo(new BigDecimal(refundMoney)) != 0) {
            return ResponseUtil.badArgumentValue();
        }

        // If the order is not refundable, it cannot be refunded
        if (!order.getOrderStatus().equals(OrderUtil.STATUS_REFUND)) {
            return ResponseUtil.fail(ORDER_CONFIRM_NOT_ALLOWED, "The order cannot confirm receipt");
        }

        // WeChat refund
        WxPayRefundRequest wxPayRefundRequest = new WxPayRefundRequest();
        wxPayRefundRequest.setOutTradeNo(order.getOrderSn());
        wxPayRefundRequest.setOutRefundNo("refund_" + order.getOrderSn());
        // Yuan to composition
        Integer totalFee = order.getActualPrice().multiply(new BigDecimal(100)).intValue();
        wxPayRefundRequest.setTotalFee(totalFee);
        wxPayRefundRequest.setRefundFee(totalFee);

        WxPayRefundResult wxPayRefundResult;
        try {
            wxPayRefundResult = wxPayService.refund(wxPayRefundRequest);
        } catch (WxPayException e) {
            logger.error(e.getMessage(), e);
            return ResponseUtil.fail(ORDER_REFUND_FAILED, "Order refund failed");
        }
        if (!wxPayRefundResult.getReturnCode().equals("SUCCESS")) {
            logger.warn("refund fail: " + wxPayRefundResult.getReturnMsg());
            return ResponseUtil.fail(ORDER_REFUND_FAILED, "Order refund failed");
        }
        if (!wxPayRefundResult.getResultCode().equals("SUCCESS")) {
            logger.warn("refund fail: " + wxPayRefundResult.getReturnMsg());
            return ResponseUtil.fail(ORDER_REFUND_FAILED, "Order refund failed");
        }

        LocalDateTime now = LocalDateTime.now();
        // Set order cancellation status
        order.setOrderStatus(OrderUtil.STATUS_REFUND_CONFIRM);
        order.setEndTime(now);
        // Record information about order refund
        order.setRefundAmount(order.getActualPrice());
        order.setRefundType("WeChat refund interface");
        order.setRefundContent(wxPayRefundResult.getRefundId());
        order.setRefundTime(now);
        if (orderService.updateWithOptimisticLocker(order) == 0) {
            throw new RuntimeException("Update data has expired");
        }

        // Increased number of goods
        List<LitemallOrderGoods> orderGoodsList = orderGoodsService.queryByOid(orderId);
        for (LitemallOrderGoods orderGoods : orderGoodsList) {
            Integer productId = orderGoods.getProductId();
            Short number = orderGoods.getNumber();
            if (productService.addStock(productId, number) == 0) {
                throw new RuntimeException("商品货品库存增加失败");
            }
        }

        // TODO sends email and SMS notifications, here uses asynchronous sending
        // Notify the user of the successful refund, for example, "The refund for the order you have applied for [order number: {1}] has been successful, please be patient and wait for the arrival."
        // Note that the order number is only sent to the last 6 digits
        notifyService.notifySmsTemplate(order.getMobile(), NotifyType.REFUND,
                new String[]{order.getOrderSn().substring(8, 14)});

        logHelper.logOrderSucceed("Refund", "Order number " + order.getOrderSn());
        return ResponseUtil.ok();
    }

    /**
     * Ship
     * 1. Check whether the current order can be shipped
     * 2. Set order shipping status
     *
     * @param body order information { orderId：xxx, shipSn: xxx, shipChannel: xxx }
     * @return Order operation result
     * Success { errno: 0, errmsg: 'success' }
     * Fail { errno: XXX, errmsg: XXX }
     */
    public Object ship(String body) {
        Integer orderId = JacksonUtil.parseInteger(body, "orderId");
        String shipSn = JacksonUtil.parseString(body, "shipSn");
        String shipChannel = JacksonUtil.parseString(body, "shipChannel");
        if (orderId == null || shipSn == null || shipChannel == null) {
            return ResponseUtil.badArgument();
        }

        LitemallOrder order = orderService.findById(orderId);
        if (order == null) {
            return ResponseUtil.badArgument();
        }

        // If the order is not paid, it cannot be shipped
        if (!order.getOrderStatus().equals(OrderUtil.STATUS_PAY)) {
            return ResponseUtil.fail(ORDER_CONFIRM_NOT_ALLOWED, "The order cannot confirm receipt");
        }

        order.setOrderStatus(OrderUtil.STATUS_SHIP);
        order.setShipSn(shipSn);
        order.setShipChannel(shipChannel);
        order.setShipTime(LocalDateTime.now());
        if (orderService.updateWithOptimisticLocker(order) == 0) {
            return ResponseUtil.updatedDateExpired();
        }

        //TODO Send mail and SMS notifications, asynchronous sending here
        // The delivery will send a notification message to the user: *
        // "Your order has been shipped, express company {1}, express order {2}, please check"
        notifyService.notifySmsTemplate(order.getMobile(), NotifyType.SHIP, new String[]{shipChannel, shipSn});

        logHelper.logOrderSucceed("Ship", "Order number " + order.getOrderSn());
        return ResponseUtil.ok();
    }

    /**
     * Delete order
     * 1. Check if the current order can be deleted
     * 2. Delete order
     *
     * @param body order information{ orderId：xxx }
     * @return Order operation result
     * Success { errno: 0, errmsg: 'success' }
     * Fail { errno: XXX, errmsg: XXX }
     */
    public Object delete(String body) {
        Integer orderId = JacksonUtil.parseInteger(body, "orderId");
        LitemallOrder order = orderService.findById(orderId);
        if (order == null) {
            return ResponseUtil.badArgument();
        }

        // If the order is not closed (cancelled, system cancelled, refunded, user confirmed, system confirmed), it cannot be deleted
        Short status = order.getOrderStatus();
        if (!status.equals(OrderUtil.STATUS_CANCEL) && !status.equals(OrderUtil.STATUS_AUTO_CANCEL) &&
                !status.equals(OrderUtil.STATUS_CONFIRM) && !status.equals(OrderUtil.STATUS_AUTO_CONFIRM) &&
                !status.equals(OrderUtil.STATUS_REFUND_CONFIRM)) {
            return ResponseUtil.fail(ORDER_DELETE_FAILED, "Order cannot be deleted");
        }
        // Delete order
        orderService.deleteById(orderId);
        // Delete order items
        orderGoodsService.deleteByOrderId(orderId);
        logHelper.logOrderSucceed("delete", "Order number " + order.getOrderSn());
        return ResponseUtil.ok();
    }

    /**
     * Reply to order
     *
     * @param body order information{ orderId：xxx }
     * @return Order operation result
     * Success { errno: 0, errmsg: 'success' }
     * Fail { errno: XXX, errmsg: XXX }
     */
    public Object reply(String body) {
        Integer commentId = JacksonUtil.parseInteger(body, "commentId");
        if (commentId == null || commentId == 0) {
            return ResponseUtil.badArgument();
        }
        // Currently only supports reply once
        LitemallComment comment = commentService.findById(commentId);
        if (comment == null) {
            return ResponseUtil.badArgument();
        }
        if (!StringUtils.isEmpty(comment.getAdminContent())) {
            return ResponseUtil.fail(ORDER_REPLY_EXIST, "Order product has been replied!");
        }
        String content = JacksonUtil.parseString(body, "content");
        if (StringUtils.isEmpty(content)) {
            return ResponseUtil.badArgument();
        }
        // Update review reply
        comment.setAdminContent(content);
        commentService.updateById(comment);

        return ResponseUtil.ok();
    }

}
