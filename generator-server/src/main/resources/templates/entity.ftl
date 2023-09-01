package ${packageName};

import javax.persistence.*;
import java.util.Date;
import com.dong.commoncore.entity.BaseEntity;

/**
*  ${classComment}
*
*  @author ${author}
*/
@Entity
@Table(name = "${tableName}")
public class ${className?cap_first} extends BaseEntity {

private static final long serialVersionUID = ${serialUID}
<#if ["id","create_time","create_user_id","update_time","update_user_id"]?seq_index_of(property.fieldName) == -1>
<#list propertyList as property>
    /**
     * ${property.comment}
     */
    private ${property.typeName} ${property.columnName};
</#list>

<#list propertyList as property>

    @Column(name = "${property.fieldName}")
    public ${property.typeName} get${property.columnName?cap_first}(){
        return this.${property.columnName};
    }

    public void set${property.columnName?cap_first}(${property.typeName} ${property.columnName}){
        this.${property.columnName} = ${property.columnName};
    }
</#list>
</#if>
}
