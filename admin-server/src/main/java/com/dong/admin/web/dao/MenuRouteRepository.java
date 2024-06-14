package com.dong.admin.web.dao;

import com.dong.admin.web.entity.MenuRoute;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuRouteRepository extends JpaRepository<MenuRoute, String> {

    List<MenuRoute> findByParentId(String parentId);

    List<MenuRoute> findAllByLevelAndHidden(Integer level, Integer hidden);
}
