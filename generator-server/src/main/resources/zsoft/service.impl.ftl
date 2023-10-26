package ${packageName};

import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;
import zsoft.gov.platform.base.query.ListConditionVo;
import zsoft.gov.platform.base.query.QueryFilter;
import zsoft.gov.platform.base.service.AbstractGenericService;

import ${basePackageName}.entity.${className?cap_first};
import ${basePackageName}.model.dto.${className?cap_first}DTO;
import ${basePackageName}.model.dto.${className?cap_first}ListDTO;
import ${basePackageName}.model.vo.${className?cap_first}ListVO;
import ${basePackageName}.model.vo.${className?cap_first}VO;
import ${basePackageName}.repository.${className?cap_first}Repository;
import ${basePackageName}.service.${className?cap_first}Service;

import java.util.ArrayList;
import java.util.List;

/**
 * ${classComment}
 *
 * @author ${author}
 */
@Service
public class ${className?cap_first}ServiceImpl
extends AbstractGenericService<${className?cap_first}, ${className?cap_first}Repository>
implements ${className?cap_first}Service {

    @Override
    public QueryFilter setQueryString(ListConditionVo listConditionVo) {
        ${className?cap_first}ListDTO dto = (${className?cap_first}ListDTO) listConditionVo;
        QueryFilter filter = new QueryFilter();
        filter.addEqual("isDelete", 0, false);

        return filter;
    }

    /**
     * 查询列表
     *
     * @param pageNumber
     * @param pageSize
     * @param dto
     * @return
     */
    @Override
    public Page<${className?cap_first}ListVO> find${className?cap_first}List(Integer pageNumber, Integer pageSize, ${className?cap_first}ListDTO dto) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize, Sort.Direction.DESC, "createdDate");
        Page<${className?cap_first}> page = this.query(dto, pageable);
        List<${className?cap_first}ListVO> result = convertVO(page.getContent());
        return new PageImpl<>(result, pageable, page.getTotalElements());
    }

    /**
     * 转换列表响应信息
     *
     * @param content
     * @return
     */
    private List<${className?cap_first}ListVO> convertVO(List<${className?cap_first}> content) {
        List<${className?cap_first}ListVO> result = new ArrayList<>();

        return result;
    }

    /**
     * 保存
     *
     * @param dto
     * @return
     */
    @Override
    public String save${className?cap_first}(${className?cap_first}DTO dto) {
        ${className?cap_first} entity = new ${className?cap_first}();
        BeanUtils.copyProperties(dto, entity);
        entity = this.repository.save(entity);
        return entity.getId();
    }

    /**
     * 查询详情
     *
     * @param id
     * @return
     */
    @Override
    public ${className?cap_first}VO get${className?cap_first}Detail(String id) {
        ${className?cap_first} entity = this.findById(id);
        return convertVO(entity);
    }

    /**
     * 转换详情响应信息
     *
     * @param entity
     * @return
     */
    private ${className?cap_first}VO convertVO(${className?cap_first} entity) {
        ${className?cap_first}VO vo = new ${className?cap_first}VO();
        BeanUtils.copyProperties(entity, vo);
        return vo;
    }

    /**
     * 逻辑删除
     *
     * @param id
     * @return
     */
    @Override
    public void remove(String id) {
        ${className?cap_first} entity = this.findById(id);
        if (entity != null) {
            entity.setIsDelete(1);
            this.repository.save(entity);
        }
    }
}
