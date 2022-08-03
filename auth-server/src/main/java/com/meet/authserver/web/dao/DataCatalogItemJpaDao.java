package com.meet.authserver.web.dao;

import com.meet.authserver.web.entity.DataCatalogItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DataCatalogItemJpaDao extends JpaRepository<DataCatalogItem, String> {

    List<DataCatalogItem> findByCatalogId(String catalogId);

    List<DataCatalogItem> findByCatalogIdAndStatus(String catalogId, Integer status);
}
