package com.dong.adminserver.web.model.dto;

import com.dong.adminserver.web.entity.DataCatalogItem;
import lombok.Data;

import java.util.List;

/**
 * @author liudong 2022/8/3
 */
@Data
public class DataCatalogDTO {

    /**
     * 主键
     */
    private String id;
    /**
     * 目录编码
     */
    private String catalogCode;
    /**
     * 目录名称
     */
    private String catalogName;
    /**
     * 描述
     */
    private String description;
    /**
     * 状态 0：禁用，1：启用
     */
    private Integer status;
    /**
     * 备注
     */
    private String remark;

    private List<DataCatalogItem> itemList;
}
