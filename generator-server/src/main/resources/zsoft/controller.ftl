package ${packageName};

import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;
import zsoft.gov.platform.base.reponse.PageResult;
import zsoft.gov.platform.base.reponse.Result;

import ${basePackageName}.model.dto.${className?cap_first}DTO;
import ${basePackageName}.model.dto.${className?cap_first}ListDTO;
import ${basePackageName}.model.vo.${className?cap_first}VO;
import ${basePackageName}.model.vo.${className?cap_first}ListVO;
import ${basePackageName}.service.${className?cap_first}Service;

import javax.annotation.Resource;

/**
 * ${classComment}
 *
 * @author ${author}
 */
@RestController
@RequestMapping("/${className}")
public class ${className?cap_first}Controller {

    @Resource
    ${className?cap_first}Service ${className}Service;

    /**
     * 查询${classComment}列表
     *
     * @param pageNumber
     * @param pageSize
     * @param dto
     * @return
     */
    @GetMapping("/find${className?cap_first}List")
    public Result<?> find${className?cap_first}List(Integer pageNumber, Integer pageSize, ${className?cap_first}ListDTO dto) {
        Page<${className?cap_first}ListVO> result = ${className}Service.find${className?cap_first}List(pageNumber, pageSize, dto);
        return Result.ok(PageResult.build(result));
    }

    /**
     * 保存${classComment}
     *
     * @param dto
     * @return
     */
    @PostMapping("/save${className?cap_first}")
    public Result<?> save${className?cap_first}(@RequestBody ${className?cap_first}DTO dto) {
        String result = ${className}Service.save${className?cap_first}(dto);
        return Result.ok(result);
    }

    /**
     * 查询${classComment}
     *
     * @param id
     * @return
     */
    @GetMapping("/detail")
    public Result<?> get${className?cap_first}Detail(String id) {
        ${className?cap_first}VO result = ${className}Service.get${className?cap_first}Detail(id);
        return Result.ok(result);
    }

    /**
     * 删除${classComment}
     *
     * @param id
     * @return
     */
    @PostMapping("/delete${className?cap_first}")
    public Result<?> delete${className?cap_first}(String id) {
        ${className}Service.remove(id);
        return Result.ok();
    }
}
