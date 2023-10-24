package ${packageName};

import java.util.Date;

/**
 *  ${classComment}列表响应对象
 *
 *  @author ${author}
 */
public class ${className?cap_first}ListVO{

<#list propertyList as property>
    <#if ["is_delete","creator_id","last_modification_time","last_modificator_id"]?seq_index_of(property.fieldName) == -1>
    /**
     * ${property.comment}
     */
    private ${property.typeName} ${property.columnName};
    </#if>
</#list>

<#list propertyList as property>
    <#if ["is_delete","creator_id","last_modification_time","last_modificator_id"]?seq_index_of(property.fieldName) == -1>
    @Column(name = "${property.fieldName}")
    public ${property.typeName} get${property.columnName?cap_first}(){
        return this.${property.columnName};
    }

    public void set${property.columnName?cap_first}(${property.typeName} ${property.columnName}){
        this.${property.columnName} = ${property.columnName};
    }

    </#if>
</#list>

}