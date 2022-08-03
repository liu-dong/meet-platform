package com.meet.authserver.web.model;

/**
 * @author liudong 2022/8/3
 */
public class DataCatalogDTO {

    /**  主键 */
    private String id;
    /**  目录编码 */
    private String catalogCode;
    /**  目录名称 */
    private String catalogName;
    /**  描述 */
    private String description;
    /**  状态 0：禁用，1：启用 */
    private Integer status;
    /**  备注 */
    private String remark;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCatalogCode() {
        return catalogCode;
    }

    public void setCatalogCode(String catalogCode) {
        this.catalogCode = catalogCode;
    }

    public String getCatalogName() {
        return catalogName;
    }

    public void setCatalogName(String catalogName) {
        this.catalogName = catalogName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
