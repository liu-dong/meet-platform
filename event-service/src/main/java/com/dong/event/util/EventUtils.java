package com.dong.event.util;

import com.dong.commoncore.util.DateUtils;
import com.dong.event.enums.UrgencyDegreeEnum;

import java.time.LocalDateTime;
import java.util.Date;

/**
 * 事件工具类
 *
 * @author liudong
 * @date 2023/3/10
 */
public class EventUtils {

    /**
     * 获取预计完成时间
     *
     * @param urgencyDegree
     * @return
     */
    public static Date getExpectCompleteDate(String urgencyDegree) {
        LocalDateTime now = LocalDateTime.now();
        //默认一个月
        LocalDateTime result = now.plusMonths(1);
        //普通事件 5天
        if (urgencyDegree.equals(UrgencyDegreeEnum.normal.name())) {
            result = now.plusDays(5);
        }
        //紧急事件 3天
        if (urgencyDegree.equals(UrgencyDegreeEnum.urgency.name())) {
            result = now.plusDays(3);
        }
        return DateUtils.toDate(result);
    }

    /**
     * 获取预计预警时间
     *
     * @param urgencyDegree
     * @return
     */
    public static Date getExpectWarnDate(String urgencyDegree) {
        LocalDateTime now = LocalDateTime.now();
        //默认一个月
        LocalDateTime result = now.plusMonths(1);
        //普通事件 2天
        if (urgencyDegree.equals(UrgencyDegreeEnum.normal.name())) {
            result = now.plusDays(2);
        }
        //紧急事件 1天
        if (urgencyDegree.equals(UrgencyDegreeEnum.urgency.name())) {
            result = now.plusDays(1);
        }
        return DateUtils.toDate(result);
    }
}
