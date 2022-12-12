package com.dong.authserver.web.dao;

import com.dong.authserver.web.entity.DataCatalog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DataCatalogJpaDao extends JpaRepository<DataCatalog, String> {


}
