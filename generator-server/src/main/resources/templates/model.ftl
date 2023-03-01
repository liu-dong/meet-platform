package ${packageName};

import lombok.Data;
import java.util.Date;
/**
*  ${classAnnotation}
*
*  @author ${author}
*/
@Data
public class ${className?cap_first}DTO {
<#list propertyList as property>
    /**
    * ${property.remark}
    */
    private ${property.typeName} ${property.columnName};
</#list>

}
