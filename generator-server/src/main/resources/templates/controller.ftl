package ${packageName};

import ${basePackageName}.model.dto.${className?cap_first}DTO;
import ${basePackageName}.model.vo.${className?cap_first}VO;
import ${basePackageName}.service.${className?cap_first}Service;
import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.ResponseResult;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 *  ${classComment}
 *
 *  @author ${author}
 */
@RestController
@RequestMapping("/${className}")
public class ${className?cap_first}Controller {

    @Resource
    ${className?cap_first}Service ${className}Service;

    /**
     * 查询${classComment}列表
     *
     * @param dto
     * @param pagination
     * @return
     */
    @GetMapping("/find${className?cap_first}List")
    public ResponseResult find${className?cap_first}List(${className?cap_first}DTO dto, Pagination pagination) {
        PageVO<${className?cap_first}VO> result = ${className}Service.find${className?cap_first}List(dto, pagination);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 保存${classComment}
     *
     * @param dto
     * @return
     */
    @PostMapping("/save${className?cap_first}")
    public ResponseResult save${className?cap_first}(@RequestBody ${className?cap_first}DTO dto) {
        String result = ${className}Service.save${className?cap_first}(dto);
        return ResponseResult.success(result, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
     * 查询${classComment}
     *
     * @param id
     * @return
     */
    @GetMapping("/get${className?cap_first}")
    public ResponseResult get${className?cap_first}(String id) {
        ${className?cap_first}VO result = ${className}Service.get${className?cap_first}(id);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 删除${classComment}
     *
     * @param id
     * @return
     */
    @PostMapping("/delete${className?cap_first}")
    public ResponseResult delete${className?cap_first}(String id) {
        ${className}Service.delete${className?cap_first}(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }
}
