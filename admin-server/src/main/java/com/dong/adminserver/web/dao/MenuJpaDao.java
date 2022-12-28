package com.dong.adminserver.web.dao;

import com.dong.adminserver.web.entity.Menu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuJpaDao extends JpaRepository<Menu, String> {

    List<Menu> getAllByParentId(String parentId);

    List<Menu> getAllByMenuLevel(int menuLevel);

    List<Menu> findAllByOrderByMenuOrderAsc();

}
