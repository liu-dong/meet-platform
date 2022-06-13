package com.meet.billingservice.web.model;


public class StaticValueDTO {

  private String id;
  private String specId;
  private String valueName;
  private String valueValue;
  private String remark;


  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getSpecId() {
    return specId;
  }

  public void setSpecId(String specId) {
    this.specId = specId;
  }

  public String getValueName() {
    return valueName;
  }

  public void setValueName(String valueName) {
    this.valueName = valueName;
  }

  public String getValueValue() {
    return valueValue;
  }

  public void setValueValue(String valueValue) {
    this.valueValue = valueValue;
  }

  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }

}
