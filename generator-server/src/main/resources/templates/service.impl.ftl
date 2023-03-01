package ${packageName};

import org.springframework.stereotype.Service;
import com.dong.commoncore.model.Pager;

@Service
public class ${className?cap_first}ServiceImpl implements ${className?cap_first}Service {

/**
* 查询${classAnnotation}列表
*
* @param dto
* @param pager
* @return
*/
@Override
public Pager
<${className?cap_first}DTO> find${className?cap_first}List(${className?cap_first}DTO dto, Pager pager) {
    return null;
    }

    /**
    * 保存${classAnnotation}
    *
    * @param dto
    * @return
    */
    @Override
    public ${className?cap_first}DTO save${className?cap_first}(${className?cap_first}DTO dto) {
    return null;
    }

    /**
    * 查询${classAnnotation}详情
    *
    * @param id
    * @return
    */
    @Override
    public ${className?cap_first}DTO get${className?cap_first}(String id) {
    return null;
    }

    /**
    * 删除${classAnnotation}
    *
    * @param id
    * @return
    */
    @Override
    public void delete${className?cap_first}(String id) {}

    }
