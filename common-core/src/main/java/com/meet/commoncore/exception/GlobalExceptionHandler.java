package com.meet.commoncore.exception;

import com.meet.commoncore.model.ResponseResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author liudong 2022/6/28
 */
@ControllerAdvice
public class GlobalExceptionHandler {

    /**
     * 通用异常处理方法
     *
     * @param e
     * @return
     */
    @ExceptionHandler(Exception.class)
    @ResponseBody
    public ResponseResult error(Exception e) {
        e.printStackTrace();
        return ResponseResult.error(e.getMessage()); // 通用异常结果
    }

    /**
     * 自定义定异常处理方法
     *
     * @param e
     * @return
     */
    @ExceptionHandler(GlobalException.class)
    @ResponseBody
    public ResponseResult error(GlobalException e) {
        e.printStackTrace();
        return ResponseResult.error(e);
    }
}
