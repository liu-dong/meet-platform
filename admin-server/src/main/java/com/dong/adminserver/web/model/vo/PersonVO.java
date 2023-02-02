package com.dong.adminserver.web.model.vo;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 人员信息
 *
 * @author LD
 */
@Data
public class PersonVO {
    private String id;//
    private String orgName;//所属单位
    private String orgId;//所属单位id
    private String name;//
    private String identityCard;//身份证
    private Integer age;//
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthdate;//出生日期
    private Integer sex;//0：男、1：女
    private String phone;//
    private String email;//
    private String presentAddress;//现住址
    private String nativePlace;//籍贯
    private String individualResume;//个人简介
    private Date createTime;//
    private Date updateTime;//

}
