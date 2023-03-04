package com.dong.warehouse.web.dao;

import com.dong.warehouse.web.entity.Inventory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InventoryJpaDao extends JpaRepository<Inventory, String> {

}