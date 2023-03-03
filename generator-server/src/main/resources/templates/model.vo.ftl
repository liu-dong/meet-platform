package ${packageName};

import lombok.Data;
import java.util.Date;

/**
*  ${classComment}
*
*  @author ${author}
*/
@Data
public class ${className?cap_first}VO{
<#list propertyList as property>

    /**
    * ${property.comment}
    */
    private ${property.typeName} ${property.columnName};
</#list>

}
