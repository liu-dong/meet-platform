package ${packageName};

import org.springframework.data.domain.Page;

import ${basePackageName}.model.dto.${className?cap_first}DTO;
import ${basePackageName}.model.list.dto.${className?cap_first}ListDTO;
import ${basePackageName}.model.vo.${className?cap_first}VO;
import ${basePackageName}.model.list.vo.${className?cap_first}ListVO;

/**
 *  ${classComment}
 *
 *  @author ${author}
 */
public interface ${className?cap_first}Service {

 /**
  * 查询列表
  *
  * @param pageNumber
  * @param pageSize
  * @param dto
  * @return
  */
 Page<${className?cap_first}ListVO> find${className?cap_first}List(Integer pageNumber, Integer pageSize, ${className?cap_first}ListDTO dto);

  /**
   * 保存
   *
   * @param dto
   * @return
   */
  String save${className?cap_first}(${className?cap_first}DTO dto);

  /**
   * 查询详情
   *
   * @param id
   * @return
   */
  ${className?cap_first}VO get${className?cap_first}Detail(String id);

 }
