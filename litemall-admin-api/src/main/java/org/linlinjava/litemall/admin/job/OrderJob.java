package org.linlinjava.litemall.admin.job;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.linlinjava.litemall.core.system.SystemConfig;
import org.linlinjava.litemall.db.domain.*;
import org.linlinjava.litemall.db.service.*;
import org.linlinjava.litemall.db.util.OrderUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

/**
 * Check order status
 */
@Component
public class OrderJob {
    private final Log logger = LogFactory.getLog(OrderJob.class);

    @Autowired
    private LitemallOrderGoodsService orderGoodsService;
    @Autowired
    private LitemallOrderService orderService;
    @Autowired
    private LitemallGoodsProductService productService;
    @Autowired
    private LitemallGrouponService grouponService;
    @Autowired
    private LitemallGrouponRulesService rulesService;

    /**
     * Automatic order confirmation
     * <p>
     * Regularly check the status of unconfirmed orders, if LITEMALL_ORDER_UNCONFIRM days expire, the order will be confirmed
     * The scheduled time is 3 am every day.
     * <p>
     * TODO
     * Note that because it is checked one day apart, the real timeout time for the order is [LITEMALL_ORDER_UNCONFIRM, 1 + LITEMALL_ORDER_UNCONFIRM]
     */
    @Scheduled(cron = "0 0 3 * * ?")
    public void checkOrderUnconfirm() {
        logger.info("The system starts a scheduled task to check whether the order has expired and automatically confirms the receipt");

        List<LitemallOrder> orderList = orderService.queryUnconfirm(SystemConfig.getOrderUnconfirm());
        for (LitemallOrder order : orderList) {

            // 设置订单已取消状态
            order.setOrderStatus(OrderUtil.STATUS_AUTO_CONFIRM);
            order.setConfirmTime(LocalDateTime.now());
            if (orderService.updateWithOptimisticLocker(order) == 0) {
                logger.info("Order ID=" + order.getId() + " The data has been updated, abandon automatic receipt confirmation");
            } else {
                logger.info("Order ID=" + order.getId() + " The receipt has been automatically confirmed overdue");
            }
        }

        logger.info("The system ends the scheduled task to check whether the order has expired and automatically confirm the receipt");
    }

    /**
     * Evaluable order product overdue
     * <p>
     * Regularly check the order product evaluation status, if you confirm that the product is overtime LITEMALL_ORDER_COMMENT days to cancel the evaluation status
     * The scheduled time is 4 am every day.
     * <p>
     * TODO
     * Note that because it is checked one day apart, the real timeout period for orders is [LITEMALL_ORDER_COMMENT, 1 + LITEMALL_ORDER_COMMENT]
     */
    @Scheduled(cron = "0 0 4 * * ?")
    public void checkOrderComment() {
        logger.info("The system opens a task to check whether the order has expired and has not been evaluated");

        List<LitemallOrder> orderList = orderService.queryComment(SystemConfig.getOrderComment());
        for (LitemallOrder order : orderList) {
            order.setComments((short) 0);
            orderService.updateWithOptimisticLocker(order);

            List<LitemallOrderGoods> orderGoodsList = orderGoodsService.queryByOid(order.getId());
            for (LitemallOrderGoods orderGoods : orderGoodsList) {
                orderGoods.setComment(-1);
                orderGoodsService.updateById(orderGoods);
            }
        }

        logger.info("The system ends the task to check whether the order has expired and has not been evaluated");
    }
}
