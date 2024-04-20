package com.dong.adminserver.web.dao;

import com.dong.adminserver.web.entity.DataCatalogItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DataCatalogItemRepository extends JpaRepository<DataCatalogItem, String> {

    List<DataCatalogItem> findByCatalogId(String catalogId);

    List<DataCatalogItem> findByCatalogIdAndStatus(String catalogId, Integer status);

    void deleteByCatalogId(String catalogId);
}
