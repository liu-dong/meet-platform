package ${packageName};

import org.springframework.data.domain.Page;
import zsoft.gov.platform.base.service.GenericService;
import ${basePackageName}.entity.${className?cap_first};
import ${basePackageName}.model.dto.${className?cap_first}DTO;
import ${basePackageName}.model.dto.${className?cap_first}ListDTO;
import ${basePackageName}.model.vo.${className?cap_first}VO;
import ${basePackageName}.model.vo.${className?cap_first}ListVO;
import ${basePackageName}.repository.${className?cap_first}Repository;

/**
 * ${classComment}
 *
 * @author ${author}
 */
public interface ${className?cap_first}Service extends GenericService<${className?cap_first}, ${className?cap_first}Repository> {

    /**
     * 查询${classComment}列表
     *
     * @param pageNumber
     * @param pageSize
     * @param dto
     * @return
     */
    Page<${className?cap_first}ListVO> find${className?cap_first}List(Integer pageNumber, Integer pageSize, ${className?cap_first}ListDTO dto);

     /**
      * 保存${classComment}
      *
      * @param dto
      * @return
      */
     String save${className?cap_first}(${className?cap_first}DTO dto);

     /**
      * 查询${classComment}详情
      *
      * @param id
      * @return
      */
     ${className?cap_first}VO get${className?cap_first}Detail(String id);

}
