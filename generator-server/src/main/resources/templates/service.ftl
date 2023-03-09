package ${packageName};

import ${basePackageName}.model.dto.${className?cap_first}DTO;
import ${basePackageName}.model.vo.${className?cap_first}VO;
import com.dong.commoncore.model.Pager;

public interface ${className?cap_first}Service {

    /**
    * 查询${classComment}列表
    *
    * @param dto
    * @param pager
    * @return
    */
    Pager<${className?cap_first}VO> find${className?cap_first}List(${className?cap_first}DTO dto, Pager<${className?cap_first}VO> pager);

    /**
    * 保存${classComment}
    *
    * @param dto
    * @return
    */
    ${className?cap_first} save${className?cap_first}(${className?cap_first}DTO dto);

    /**
    * 查询${classComment}详情
    *
    * @param id
    * @return
    */
    ${className?cap_first} get${className?cap_first}(String id);

    /**
    * 删除${classComment}
    *
    * @param id
    * @return
    */
    void delete${className?cap_first}(String id);

}