package com.dong.adminserver.web.model.dto;

import lombok.Data;

@Data
public class DataCatalogItemDTO {
    /**
     * 主键
     */
    private String id;

    /**
     * 目录id
     */
    private String catalogId;

    /**
     * 条目编码
     */
    private String itemCode;

    /**
     * 条目名称
     */
    private String itemName;

    /**
     * 排序
     */
    private Integer sort;

    /**
     * 状态 0：禁用，1：启用
     */
    private Integer status;

    /**
     * 备注
     */
    private String remark;
}
