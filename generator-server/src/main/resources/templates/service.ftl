package ${packageName};

import ${basePackageName}.model.dto.${className?cap_first}DTO;
import ${basePackageName}.model.vo.${className?cap_first}VO;
import com.dong.commoncore.model.PageVO;

/**
 *  ${classComment}
 *
 *  @author ${author}
 */
public interface ${className?cap_first}Service {

    /**
     * 查询${classComment}列表
     *
     * @param dto
     * @param pagination
     * @return
     */
    PageVO<${className?cap_first}VO> find${className?cap_first}List(${className?cap_first}DTO dto, Pagination pagination);

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
    ${className?cap_first}VO get${className?cap_first}(String id);

    /**
     * 删除${classComment}
     *
     * @param id
     * @return
     */
    void delete${className?cap_first}(String id);

}
