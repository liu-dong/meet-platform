package com.dong.adminserver.web.dao;

import com.dong.adminserver.web.entity.DataCatalog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DataCatalogJpaDao extends JpaRepository<DataCatalog, String> {


}
