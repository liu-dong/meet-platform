package ${packageName};

import org.hibernate.annotations.SQLDelete;
import zsoft.gov.platform.base.domain.AbstractDomainEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

/**
 * ${classComment}
 *
 * @author liudong
 */
@Entity
@Table(name = "${tableName}")
@SQLDelete(sql = "UPDATE ${tableName} SET IS_DELETE = 1 WHERE id = ?")
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
    public ${property.typeName} get${property.columnName?cap_first}() {
        return this.${property.columnName};
    }

    public void set${property.columnName?cap_first}(${property.typeName} ${property.columnName}) {
        this.${property.columnName} = ${property.columnName};
    }

    </#if>
</#list>
}
