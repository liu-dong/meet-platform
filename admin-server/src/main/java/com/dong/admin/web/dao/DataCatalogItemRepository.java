package com.dong.admin.web.dao;

import com.dong.admin.web.entity.DataCatalogItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DataCatalogItemRepository extends JpaRepository<DataCatalogItem, String> {

    List<DataCatalogItem> findByCatalogId(String catalogId);

    List<DataCatalogItem> findByCatalogIdAndStatusOrderBySortAsc(String catalogId, Integer status);

    void deleteByCatalogId(String catalogId);
}
