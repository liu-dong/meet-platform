package ${packageName};

import ${basePackageName}.entity.${className?cap_first};
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ${className?cap_first}Repository extends JpaRepository<${className?cap_first}, String> {

}
