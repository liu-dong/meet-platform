package com.meet.commoncore.annotation;

import java.lang.annotation.*;

/**
 * 操作日志注解
 *
 * @author liudong
 */
@Target(ElementType.METHOD) //注解放置的目标位置,METHOD是可注解在方法级别上
@Retention(RetentionPolicy.RUNTIME) //注解在哪个阶段执行
@Documented
public @interface Log {

    String moduleName() default ""; // 操作模块名称

    String moduleCode() default ""; // 操作模块编码

    String operateType() default "";  // 操作类型

    String operateContent() default "";  // 操作说明
}
