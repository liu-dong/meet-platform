package com.dong.plan.web.model.vo;

import lombok.Data;

import java.util.Date;

/**
 * 任务
 *
 * @author Lenovo
 */
@Data
public class TaskVO {

    /**
     * 主键id
     */
    private String id;

    /**
     * 计划id
     */
    private String planId;

    /**
     * 任务名称
     */
    private String taskName;

    /**
     * 任务内容
     */
    private String taskContent;

    /**
     * 优先级别 lowest：最低、low：低、medium：一般、high：高、highest：最高
     */
    private String priorityLevel;

    /**
     * 截止日期
     */
    private Object deadline;

    /**
     * 实际完成时间
     */
    private Date actualFinishTime;

    /**
     * 任务状态 finished：完成、unfinished：未完成
     */
    private String taskStatus;

    /**
     * 任务进度 1：未开始，2：进行中，3：已完成，4：延期
     */
    private Integer taskProgress;

    /**
     * 延期原因
     */
    private String delayReason;

    /**
     * 分析
     */
    private String analyse;

    /**
     * 改进措施
     */
    private String improvement;

    /**
     * 评估总结
     */
    private String summarize;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 创建人id
     */
    private String createUserId;

    /**
     * 修改时间
     */
    private Date updateTime;

    /**
     * 修改人id
     */
    private String updateUserId;

    /**
     * 删除状态：0 未删除、1 已删除
     */
    private Integer deleteStatus;

}
