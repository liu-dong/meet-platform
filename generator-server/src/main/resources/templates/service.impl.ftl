package ${packageName};

import ${basePackageName}.model.dto.${className?cap_first}DTO;
import ${basePackageName}.model.vo.${className?cap_first}VO;
import ${basePackageName}.service.${className?cap_first}Service;
import ${basePackageName}.dao.${className?cap_first}Repository;
import org.springframework.stereotype.Service;
import com.dong.commoncore.model.PageVO;

import javax.annotation.Resource;

@Service
public class ${className?cap_first}ServiceImpl implements ${className?cap_first}Service {

    @Resource
    ${className?cap_first}Repository ${className}Repository;

    /**
     * 查询${classComment}列表
     *
     * @param dto
     * @param pagination
     * @return
     */
    @Override
    public PageVO<${className?cap_first}VO> find${className?cap_first}List(${className?cap_first}DTO dto, Pagination pagination) {
        return null;
    }

    /**
     * 保存${classComment}
     *
     * @param dto
     * @return
     */
    @Override
    public String save${className?cap_first}(${className?cap_first}DTO dto) {
        return null;
    }

    /**
     * 查询${classComment}详情
     *
     * @param id
     * @return
     */
    @Override
    public ${className?cap_first}VO get${className?cap_first}(String id) {
        return null;
    }

    /**
     * 删除${classComment}
     *
     * @param id
     * @return
     */
    @Override
    public void delete${className?cap_first}(String id) {}

}
