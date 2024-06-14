package com.dcsec.server.web.model.vo;

import lombok.Data;
import java.util.Date;

/**
 *  物证告警
 *
 *  @author LD
 */
@Data
public class EvidenceAlarmVO{

    /**
     * 
     */
    private String id;

    /**
     * 
     */
    private Date createTime;

    /**
     * 
     */
    private String createBy;

    /**
     * 
     */
    private Date lastUpdateTime;

    /**
     * 
     */
    private String lastUpdateBy;

    /**
     * 物证id
     */
    private String evidenceId;

    /**
     * 仓库id
     */
    private String warehouseid;

    /**
     * 仓库名称
     */
    private String warehousename;

    /**
     * 用户id
     */
    private String userid;

    /**
     * 用户名称
     */
    private String username;

    /**
     * 案件id
     */
    private String caseid;

    /**
     * 案件名称
     */
    private String casename;

    /**
     * 部门id
     */
    private String departmentid;

    /**
     * 部门名称
     */
    private String departmentname;

    /**
     * 物证编号
     */
    private String no;

    /**
     * 物证名称
     */
    private String name;

    /**
     * 告警人
     */
    private String personname;

    /**
     * 告警时间
     */
    private Date alarmDate;

}
