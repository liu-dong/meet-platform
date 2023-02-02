package com.dong.adminserver.web.service;

import com.dong.adminserver.web.entity.DataCatalog;
import com.dong.adminserver.web.model.dto.DataCatalogDTO;
import com.dong.adminserver.web.model.vo.DataCatalogVO;
import com.dong.commoncore.model.Pager;

import java.util.List;
import java.util.Map;

/**
 * @author liudong 2022/8/3
 */
public interface DataCatalogService {

    /**
     * 保存数据目录
     *
     * @param dto
     * @return
     */
    DataCatalogVO saveDataCatalog(DataCatalogDTO dto);

    /**
     * 查询数据目录
     *
     * @param id 主键
     * @return
     * @throws Exception 异常
     */
    DataCatalog findDataCatalog(String id) throws Exception;

    /**
     * 删除数据目录
     *
     * @param id 主键
     * @throws Exception 异常
     */
    void deleteDataCatalog(String id) throws Exception;

    /**
     * 查询数据目录
     *
     * @param dto   查询参数
     * @param pager 分页参数
     * @return 数据目录列表
     */
    Pager<DataCatalogDTO> findDataCatalogList(DataCatalogDTO dto, Pager<DataCatalogDTO> pager);

    /**
     * 查询数据字典条目集合
     *
     * @return 返回数据目录编码与数据条目键值对
     */
    Map<String, Object> findDataCatalogItemList();

    /**
     * 根据数据目录编码查询数据条目
     *
     * @param catalogCode
     * @return
     */
    List<Map<String, Object>> getDataCatalogItem(String catalogCode);


}
