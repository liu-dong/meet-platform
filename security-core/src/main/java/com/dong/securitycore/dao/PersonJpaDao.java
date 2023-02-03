package com.dong.securitycore.dao;

import com.dong.securitycore.entity.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface PersonJpaDao extends JpaRepository<Person, String> {

    Person getById(String id);

    List<Person> findPersonByOrgId(String orgId);

    Person getPersonByEmail(String email);
}
