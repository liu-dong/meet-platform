package ${packageName};

import javax.persistence.*;
import java.util.Date;
import zsoft.gov.platform.base.domain.AbstractDomainEntity;

/**
 *  ${classComment}
 *
 *  @author ${author}
 */
@Entity
@Table(name = "${tableName}")
public class ${className?cap_first} extends AbstractDomainEntity {

    private static final long serialVersionUID = ${serialUID}

<#list propertyList as property>
    <#if ["id","creation_time","creator_id","last_modification_time","last_modificator_id"]?seq_index_of(property.fieldName?lower_case) == -1>
    /**
     * ${property.comment}
     */
    private ${property.typeName} ${property.columnName};

    </#if>
</#list>

<#list propertyList as property>
    <#if ["id","creation_time","creator_id","last_modification_time","last_modificator_id"]?seq_index_of(property.fieldName?lower_case) == -1>
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
