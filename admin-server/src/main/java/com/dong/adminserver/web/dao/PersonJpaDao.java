package com.dong.adminserver.web.dao;

import com.dong.adminserver.web.entity.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface PersonJpaDao extends JpaRepository<Person, String> {

    Person getById(String id);

    List<Person> findPersonByCompanyId(String companyId);

    Person getPersonByEmail(String email);
}
