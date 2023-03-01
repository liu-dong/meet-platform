package ${packageName};

import com.dong.commoncore.model.Pager;

public interface ${className?cap_first}Service {

/**
* 查询${classAnnotation}列表
*
* @param dto
* @param pager
* @return
*/
Pager
<${className?cap_first}VO> find${className?cap_first}List(${className?cap_first}DTO dto, Pager pager);

    /**
    * 保存${classAnnotation}
    *
    * @param dto
    * @return
    */
    ${className?cap_first}DTO save${className?cap_first}(${className?cap_first}DTO dto);

    /**
    * 查询${classAnnotation}详情
    *
    * @param id
    * @return
    */
    ${className?cap_first}DTO get${className?cap_first}(String id);

    /**
    * 删除${classAnnotation}
    *
    * @param id
    * @return
    */
    void delete${className?cap_first}(String id);

    }