package com.dong.admin.web.dao;

import com.dong.admin.web.entity.DataCatalog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DataCatalogRepository extends JpaRepository<DataCatalog, String> {


}
