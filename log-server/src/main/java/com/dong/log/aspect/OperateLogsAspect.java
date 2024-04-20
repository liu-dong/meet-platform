package com.dong.log.aspect;

import com.alibaba.fastjson.JSON;
import com.dong.commoncore.enums.ApplicationEnum;
import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.util.AddressUtils;
import com.dong.commoncore.util.CommonUtils;
import com.dong.log.web.dao.OperateLogsRepository;
import com.dong.log.web.entity.OperateLogs;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.security.Principal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * @author liudong 2022/2/10
 */
@Aspect
@Component
public class OperateLogsAspect {

    @Value("${spring.application.name:default}")
    private String resourceId;

    @Resource
    OperateLogsRepository operateLogsRepository;

    /**
     * 设置操作日志切入点 记录操作日志 在注解的位置切入代码
     */
    @Pointcut("@annotation(com.dong.commoncore.annotation.Log) || execution(* com.dong..*.controller..*.*(..)) ")
    public void operateLogPointCut() {
    }

    /**
     * 正常返回通知，拦截用户操作日志，连接点正常执行完成后执行， 如果连接点抛出异常，则不会执行
     *
     * @param joinPoint 切入点
     * @param result    被增强方法的返回结果
     */
    @AfterReturning(value = "operateLogPointCut()", returning = "result")
    public void saveOperateLog(JoinPoint joinPoint, Object result) {
        // 获取RequestAttributes
        RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
        // 从获取RequestAttributes中获取HttpServletRequest的信息
        HttpServletRequest request = (HttpServletRequest) requestAttributes.resolveReference(RequestAttributes.REFERENCE_REQUEST);
        //用户
        String username = "未登录";
        Principal userPrincipal = request.getUserPrincipal();
        if (userPrincipal != null) {
            username = userPrincipal.getName();
        }
        //ip
        String ip = AddressUtils.getIP(Objects.requireNonNull(request));
        //操作对象
        String operateObject = getOperateObject(joinPoint);
        //操作内容
        String operateContent = getOperateContent(request, result);
        //保存操作日志
        savaOperateLogs(username, operateObject, operateContent, ip);
    }

    /**
     * 获取操作内容
     *
     * @param request
     * @param result
     * @return
     */
    private String getOperateContent(HttpServletRequest request, Object result) {
        String operateContent;
        Map<String, Object> content = new HashMap<>();
        // 请求的参数
        Map<String, String[]> parameterMap = request.getParameterMap();
        content.put("请求参数", JSON.toJSONString(parameterMap));
        //请求路径
        content.put("请求路径", request.getRequestURI());
        if (result instanceof ResponseResult) {
            content.put("请求结果", ((ResponseResult) result).getMessage());
        }
        // 将参数所在的数组转换成json
        operateContent = JSON.toJSONString(content);
        return operateContent;
    }

    /**
     * 获取操作对象
     *
     * @param joinPoint
     * @return
     */
    private String getOperateObject(JoinPoint joinPoint) {
        // 从切面织入点处通过反射机制获取织入点处的方法
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        // 获取切入点所在的方法
        Method method = signature.getMethod();
        //Log log = method.getAnnotation(Log.class);
        // 获取请求的类名
        String className = joinPoint.getTarget().getClass().getName();
        // 获取请求的方法名
        String methodName = method.getName();
        return className + "." + methodName;
    }

    /**
     * 保存操作日志
     *
     * @param username
     * @param operateObject
     * @param operateContent
     * @param ip
     */
    public void savaOperateLogs(String username, String operateObject, String operateContent, String ip) {
        OperateLogs operateLogs = new OperateLogs();
        operateLogs.setId(CommonUtils.getUUID());
        operateLogs.setAccount(username);
        operateLogs.setOperateTime(new Date());
        String moduleName = ApplicationEnum.getApplicationName(resourceId);
        String moduleCode = resourceId;
        String operateType = "select";
        operateLogs.setModuleCode(moduleCode);
        operateLogs.setModuleName(moduleName);
        operateLogs.setOperateType(operateType);
        operateLogs.setOperateObject(operateObject);
        operateLogs.setContent(operateContent);
        operateLogs.setLoginIp(ip);
        operateLogs.setCreateTime(new Date());
        operateLogs.setUpdateTime(new Date());
        operateLogsRepository.save(operateLogs);
    }
}
