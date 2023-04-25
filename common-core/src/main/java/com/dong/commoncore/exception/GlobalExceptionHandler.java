package com.dong.commoncore.exception;

import com.dong.commoncore.model.ResponseResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.NoSuchElementException;

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

    /**
     * 运行时异常处理方法
     *
     * @param e
     * @return
     */
    @ExceptionHandler(RuntimeException.class)
    @ResponseBody
    public ResponseResult error(RuntimeException e) {
        e.printStackTrace();
        return ResponseResult.error(e.getMessage());
    }

    @ExceptionHandler(NoSuchElementException.class)
    @ResponseBody
    public ResponseResult error() {
        return ResponseResult.error("无值存在");
    }

    @ExceptionHandler(IllegalArgumentException.class)
    @ResponseBody
    public ResponseResult error(IllegalArgumentException e) {
        return ResponseResult.error(e.getMessage());
    }
}
