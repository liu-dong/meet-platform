package ${packageName};

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ${className?cap_first}JpaDao extends JpaRepository<${className?cap_first}, String> {

}