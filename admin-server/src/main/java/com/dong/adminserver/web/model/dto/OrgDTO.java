package com.dong.adminserver.web.model.dto;

import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * 组织机构
 *
 * @author LD
 */
@Data
public class OrgDTO {
    private String id;//主键id
    private String orgName;//单位名称
    private String orgCode;//单位编码
    private Integer orgType;//单位类型
    private String orgDivisionCode;//单位区域代码
    private String orgAddress;//地址
    private Integer deleteStatus;//是否删除 0：未删除、1：已删除
    private Date createTime;//创建时间
    private String createUserId;//创建人id
    private Date updateTime;//修改时间
    private String updateUserId;//修改人id
    private List<String> personIds;//人员id

}
