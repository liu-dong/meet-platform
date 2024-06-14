package com.dcsec.server.web.model.dto;

import lombok.Data;
import java.util.Date;

/**
 *  物证
 *
 *  @author LD
 */
@Data
public class EvidenceDTO {

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
     * 用户id
     */
    private String userId;

    /**
     * 用户名称
     */
    private String userName;

    /**
     * 仓库id
     */
    private String warehouseId;

    /**
     * 仓库名称
     */
    private String warehouseName;

    /**
     * 案件id
     */
    private String caseId;

    /**
     * 案件名称
     */
    private String caseName;

    /**
     * 部门id
     */
    private String departmentId;

    /**
     * 部门名称
     */
    private String departmentName;

    /**
     * 物证编号
     */
    private String no;

    /**
     * 物证名称
     */
    private String name;

    /**
     * image
     */
    private String image;

    /**
     * 物证序号
     */
    private Integer indexEvi;

    /**
     * 电子标签号
     */
    private String rfid;

    /**
     * 条码标签号
     */
    private String barCode;

    /**
     * 物证持有人
     */
    private String owner;

    /**
     * 扣押人
     */
    private String distrainer;

    /**
     * 是否暂存
     */
    private Integer isTempStorate;

    /**
     * 物证状态
     */
    private Integer status;

    /**
     * 存放期限
     */
    private Date validDate;

    /**
     * 备注
     */
    private Object memo;

    /**
     * 是否已写标签号
     */
    private Integer isRfidWrite;

    /**
     * 是否打印条码
     */
    private Integer isBarCodePrint;

    /**
     * 物证视频
     */
    private String video;

    /**
     * 物证属性
     */
    private String attribute;

    /**
     * 物证属性名称
     */
    private String attributename;

    /**
     * 案件生效日期
     */
    private Date takeeffecttime;

}
