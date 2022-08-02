package com.meet.authserver.web.dao;

import com.meet.authserver.web.entity.DataCatalogItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DataCatalogItemJpaDao extends JpaRepository<DataCatalogItem, String> {


}
