package org.linlinjava.litemall.admin.service;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.linlinjava.litemall.core.util.IpUtil;
import org.linlinjava.litemall.db.domain.LitemallAdmin;
import org.linlinjava.litemall.db.domain.LitemallLog;
import org.linlinjava.litemall.db.service.LitemallLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * The log types here are designed into four types (of course developers need to be able to expand their own)
 * General log: The general operation log that the user feels needs to view, the recommended log level is the default
 * Security log: Operation logs related to user security, such as login and delete administrator
 * Order log: operation logs related to user transactions, such as order shipment and refund
 * Other logs: If the above three are not suitable, you can choose other logs. It is recommended that the log level with the lowest priority
 * <p>
 * Of course, many operations may not need to be recorded in the database, such as editing commodities and editing advertisements.
 */
@Component
public class LogHelper {
    public static final Integer LOG_TYPE_GENERAL = 0;
    public static final Integer LOG_TYPE_AUTH = 1;
    public static final Integer LOG_TYPE_ORDER = 2;
    public static final Integer LOG_TYPE_OTHER = 3;

    @Autowired
    private LitemallLogService logService;

    public void logGeneralSucceed(String action) {
        logAdmin(LOG_TYPE_GENERAL, action, true, "", "");
    }

    public void logGeneralSucceed(String action, String result) {
        logAdmin(LOG_TYPE_GENERAL, action, true, result, "");
    }

    public void logGeneralFail(String action, String error) {
        logAdmin(LOG_TYPE_GENERAL, action, false, error, "");
    }

    public void logAuthSucceed(String action) {
        logAdmin(LOG_TYPE_AUTH, action, true, "", "");
    }

    public void logAuthSucceed(String action, String result) {
        logAdmin(LOG_TYPE_AUTH, action, true, result, "");
    }

    public void logAuthFail(String action, String error) {
        logAdmin(LOG_TYPE_AUTH, action, false, error, "");
    }

    public void logOrderSucceed(String action) {
        logAdmin(LOG_TYPE_ORDER, action, true, "", "");
    }

    public void logOrderSucceed(String action, String result) {
        logAdmin(LOG_TYPE_ORDER, action, true, result, "");
    }

    public void logOrderFail(String action, String error) {
        logAdmin(LOG_TYPE_ORDER, action, false, error, "");
    }

    public void logOtherSucceed(String action) {
        logAdmin(LOG_TYPE_OTHER, action, true, "", "");
    }

    public void logOtherSucceed(String action, String result) {
        logAdmin(LOG_TYPE_OTHER, action, true, result, "");
    }


    public void logOtherFail(String action, String error) {
        logAdmin(LOG_TYPE_OTHER, action, false, error, "");
    }

    public void logAdmin(Integer type, String action, Boolean succeed, String result, String comment) {
        LitemallLog log = new LitemallLog();

        Subject currentUser = SecurityUtils.getSubject();
        if (currentUser != null) {
            LitemallAdmin admin = (LitemallAdmin) currentUser.getPrincipal();
            if (admin != null) {
                log.setAdmin(admin.getUsername());
            } else {
                log.setAdmin("匿名用户");
            }
        } else {
            log.setAdmin("匿名用户");
        }

        HttpServletRequest request =
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        if (request != null) {
            log.setIp(IpUtil.getIpAddr(request));
        }

        log.setType(type);
        log.setAction(action);
        log.setStatus(succeed);
        log.setResult(result);
        log.setComment(comment);
        logService.add(log);
    }

}
