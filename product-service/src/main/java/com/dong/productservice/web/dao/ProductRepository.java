package com.dong.productservice.web.dao;

import com.dong.productservice.web.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, String> {

    Product getByProductName(String productName);
}
