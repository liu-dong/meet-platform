package com.dong.admin.web.dao;

import com.dong.admin.web.entity.MenuRoute;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MenuRouteRepository extends JpaRepository<MenuRoute, String> {

    MenuRoute getByMenuId(String menuId);
}
