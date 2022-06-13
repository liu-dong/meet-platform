package com.meet.billingservice.web.model;


import java.util.List;

public class StaticSpecDTO {

  private String id;
  private String specCode;
  private String specName;
  private String specDesc;
  private String defaultValue;
  private String remark;

  private List<StaticValueDTO> values;

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getSpecCode() {
    return specCode;
  }

  public void setSpecCode(String specCode) {
    this.specCode = specCode;
  }

  public String getSpecName() {
    return specName;
  }

  public void setSpecName(String specName) {
    this.specName = specName;
  }

  public String getSpecDesc() {
    return specDesc;
  }

  public void setSpecDesc(String specDesc) {
    this.specDesc = specDesc;
  }

  public String getDefaultValue() {
    return defaultValue;
  }

  public void setDefaultValue(String defaultValue) {
    this.defaultValue = defaultValue;
  }

  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }

  public List<StaticValueDTO> getValues() {
    return values;
  }

  public void setValues(List<StaticValueDTO> values) {
    this.values = values;
  }

}
