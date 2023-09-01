package ${packageName};

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
*  ${classComment}
*
*  @author ${author}
*/
@Entity
@Table(name = "${tableName}")
public class ${className?cap_first} implements Serializable {

    private static final long serialVersionUID = ${serialUID}

<#list propertyList as property>

    /**
    * ${property.comment}
    */
    private ${property.typeName} ${property.columnName};
</#list>

<#list propertyList as property>

    <#if property.fieldName == "id">
    @Id
    </#if>
    @Column(name = "${property.fieldName}")
    public ${property.typeName} get${property.columnName?cap_first}(){
        return this.${property.columnName};
    }

    public void set${property.columnName?cap_first}(${property.typeName} ${property.columnName}){
        this.${property.columnName} = ${property.columnName};
    }
</#list>
}
