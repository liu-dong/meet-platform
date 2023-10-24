package ${packageName};

import zsoft.gov.platform.base.query.ListConditionVo;
import zsoft.gov.platform.base.query.QueryFilter;
import zsoft.gov.platform.base.service.AbstractGenericService;

import ${basePackageName}.model.dto.${className?cap_first}DTO;
import ${basePackageName}.model.list.dto.${className?cap_first}ListDTO;
import ${basePackageName}.model.vo.${className?cap_first}VO;
import ${basePackageName}.model.list.vo.${className?cap_first}ListVO;
import ${basePackageName}.service.${className?cap_first}Service;
import ${basePackageName}.repository.${className?cap_first}Repository;

import org.springframework.stereotype.Service;
import org.springframework.data.domain.Page;

import javax.annotation.Resource;

/**
*  ${classComment}
*
*  @author ${author}
*/
@Service
public class ${className?cap_first}ServiceImpl
extends AbstractGenericService<${className?cap_first}, ${className?cap_first}Repository>
implements ${className?cap_first}Service {

    @Override
    public QueryFilter setQueryString(ListConditionVo listConditionVo) {
        ${className?cap_first}ListDTO listVo = (${className?cap_first}ListDTO) listConditionVo;
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
    public Page<${className?cap_first}VO> find${className?cap_first}List(${className?cap_first}DTO dto,
        Pager<${className?cap_first}VO> pager) {

        Pageable pageable = PageRequest.of(pageNumber, pageSize, Sort.Direction.DESC, "createdDate");
        Page<${className?cap_first}> page = this.query(listVo, pageable);
        List<${className?cap_first}ListVO> result = convertVO(page.getContent());
        return new PageImpl<>(result, pageable, page.getTotalElements());
    }

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
        return null;
    }

    /**
     * 查询详情
     *
     * @param id
     * @return
     */
    @Override
    public ${className?cap_first}VO get${className?cap_first}(String id) {
        ${className?cap_first} entity = this.findById(id);
        return convertVO(entity);
    }

    /**
    * 转换响应信息
    *
    * @param id
    * @return
    */
    private ${className?cap_first}VO convertVO(${className?cap_first} entity) {
        return null;
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
