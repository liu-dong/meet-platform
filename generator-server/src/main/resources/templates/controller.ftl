package ${packageName};

import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
*  ${classAnnotation}
*
*  @author ${author}
*/
@Api(tags = "${classAnnotation}管理模块")
@RestController
@RequestMapping("/${className}")
public class ${className?cap_first}Controller {

@Autowired
private ${className?cap_first}Service ${className}Service;

/**
* 查询${classAnnotation}列表
*
* @param dto
* @param pager
* @return
*/
@ApiOperation("查询${classAnnotation}列表")
@PostMapping("/find${className?cap_first}List")
public ResponseResult find${className?cap_first}List(${className?cap_first}DTO dto, Pager pager) {
Pager
<${className?cap_first}DTO> dtoList = ${className}Service.find${className?cap_first}List(dto, pager);
    return ResponseResult.success(dtoList, "查询成功!");
    }

    /**
    * 保存${classAnnotation}
    *
    * @param dto
    * @return
    */
    @ApiOperation("保存${classAnnotation}")
    @PostMapping("/save${className?cap_first}")
    public ResponseResult save${className?cap_first}(${className?cap_first}DTO dto) {
    ${className?cap_first}DTO result = ${className}Service.save${className?cap_first}(dto);
    return ResponseResult.success(dto, "保存成功!");
    }

    /**
    * 查询${classAnnotation}
    *
    * @param id
    * @return
    */
    @ApiOperation("查询${classAnnotation}")
    @GetMapping("/get${className?cap_first}")
    public ResponseResult get${className?cap_first}(String id) {
    ${className?cap_first}DTO result = ${className}Service.get${className?cap_first}(id);
    return ResponseResult.success(dto, "查询成功!");
    }

    /**
    * 删除${classAnnotation}
    *
    * @param id
    * @return
    */
    @ApiOperation("删除${classAnnotation}")
    @PostMapping("/delete${className?cap_first}")
    public ResponseResult delete${className?cap_first}(String id) {
    ${className}Service.delete${className?cap_first}(id);
    return ResponseResult.success("删除成功!");
    }
    }
