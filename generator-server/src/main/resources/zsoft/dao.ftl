package ${packageName};

import ${basePackageName}.entity.${className?cap_first};
import zsoft.gov.platform.base.repository.GenericJpaRepository;
import org.springframework.stereotype.Repository;

/**
*  ${classComment}
*
*  @author ${author}
*/
@Repository
public interface ${className?cap_first}Repository extends GenericJpaRepository<${className?cap_first}, String> {

}
