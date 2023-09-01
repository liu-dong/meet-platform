package com.dong.plan.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
 * 任务
 *
 * @author Lenovo
 */
@Entity
@Table(name = "task")
public class Task implements Serializable {

    private static final long serialVersionUID = 7657493304927836688L;

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


    @Id
    @Column(name = "id")
    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Column(name = "plan_id")
    public String getPlanId() {
        return this.planId;
    }

    public void setPlanId(String planId) {
        this.planId = planId;
    }

    @Column(name = "task_name")
    public String getTaskName() {
        return this.taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    @Column(name = "task_content")
    public String getTaskContent() {
        return this.taskContent;
    }

    public void setTaskContent(String taskContent) {
        this.taskContent = taskContent;
    }

    @Column(name = "priority_level")
    public String getPriorityLevel() {
        return this.priorityLevel;
    }

    public void setPriorityLevel(String priorityLevel) {
        this.priorityLevel = priorityLevel;
    }

    @Column(name = "deadline")
    public Object getDeadline() {
        return this.deadline;
    }

    public void setDeadline(Object deadline) {
        this.deadline = deadline;
    }

    @Column(name = "actual_finish_time")
    public Date getActualFinishTime() {
        return this.actualFinishTime;
    }

    public void setActualFinishTime(Date actualFinishTime) {
        this.actualFinishTime = actualFinishTime;
    }

    @Column(name = "task_status")
    public String getTaskStatus() {
        return this.taskStatus;
    }

    public void setTaskStatus(String taskStatus) {
        this.taskStatus = taskStatus;
    }

    @Column(name = "task_progress")
    public Integer getTaskProgress() {
        return this.taskProgress;
    }

    public void setTaskProgress(Integer taskProgress) {
        this.taskProgress = taskProgress;
    }

    @Column(name = "delay_reason")
    public String getDelayReason() {
        return this.delayReason;
    }

    public void setDelayReason(String delayReason) {
        this.delayReason = delayReason;
    }

    @Column(name = "analyse")
    public String getAnalyse() {
        return this.analyse;
    }

    public void setAnalyse(String analyse) {
        this.analyse = analyse;
    }

    @Column(name = "improvement")
    public String getImprovement() {
        return this.improvement;
    }

    public void setImprovement(String improvement) {
        this.improvement = improvement;
    }

    @Column(name = "summarize")
    public String getSummarize() {
        return this.summarize;
    }

    public void setSummarize(String summarize) {
        this.summarize = summarize;
    }

    @Column(name = "create_time")
    public Date getCreateTime() {
        return this.createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Column(name = "create_user_id")
    public String getCreateUserId() {
        return this.createUserId;
    }

    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId;
    }

    @Column(name = "update_time")
    public Date getUpdateTime() {
        return this.updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Column(name = "update_user_id")
    public String getUpdateUserId() {
        return this.updateUserId;
    }

    public void setUpdateUserId(String updateUserId) {
        this.updateUserId = updateUserId;
    }

    @Column(name = "delete_status")
    public Integer getDeleteStatus() {
        return this.deleteStatus;
    }

    public void setDeleteStatus(Integer deleteStatus) {
        this.deleteStatus = deleteStatus;
    }
}
