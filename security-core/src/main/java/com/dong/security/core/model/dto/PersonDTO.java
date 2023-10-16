package com.dong.security.core.model.dto;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 人员信息
 *
 * @author LD
 */
@Data
public class PersonDTO {
    private String id;//
    private String orgName;//所属单位
    private String orgId;//所属单位id
    private String name;//
    private String identityCard;//身份证
    private Integer age;//
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthdate;//出生日期
    private String sex;//0：男、1：女
    private String phone;//
    private String email;//
    private String presentAddress;//现住址
    private String nativePlace;//籍贯
    private String individualResume;//个人简介
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private String createTime;//
    private String updateTime;//

}
