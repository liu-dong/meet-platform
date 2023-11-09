package ${packageName};

import org.springframework.stereotype.Repository;
import zsoft.gov.platform.base.repository.GenericJpaRepository;
import ${basePackageName}.entity.${className?cap_first};

/**
 * ${classComment}
 *
 * @author liudong
 */
@Repository
public interface ${className?cap_first}Repository extends GenericJpaRepository<${className?cap_first}, String> {

}
