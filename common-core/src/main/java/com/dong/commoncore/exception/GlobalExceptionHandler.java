package com.dong.commoncore.exception;

import com.dong.commoncore.model.ResponseResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.NoSuchElementException;

/**
 * 统一异常处理
 *
 * @author liudong 2022/6/28
 */
@RestControllerAdvice
public class GlobalExceptionHandler {

    /**
     * 通用异常处理方法
     *
     * @param e
     * @return
     */
    @ExceptionHandler(Exception.class)
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
    public ResponseResult error(GlobalException e) {
        e.printStackTrace();
        return ResponseResult.error(e);
    }

    /**
     * 自定义定异常处理方法
     *
     * @param e
     * @return
     */
    @ExceptionHandler(AttachmentException.class)
    public ResponseResult error(AttachmentException e) {
        e.printStackTrace();
        return ResponseResult.error(e.getMessage());
    }

    /**
     * 自定义定异常处理方法
     *
     * @param e
     * @return
     */
    @ExceptionHandler(MinioException.class)
    public ResponseResult error(MinioException e) {
        e.printStackTrace();
        return ResponseResult.error(e.getMessage());
    }

    /**
     * 自定义定异常处理方法
     *
     * @param e
     * @return
     */
    @ExceptionHandler(TokenException.class)
    public ResponseResult error(TokenException e) {
        e.printStackTrace();
        return ResponseResult.error(e.getMessage());
    }

    /**
     * 自定义定异常处理方法
     *
     * @param e
     * @return
     */
    @ExceptionHandler(UserException.class)
    public ResponseResult error(UserException e) {
        e.printStackTrace();
        return ResponseResult.error(e.getMessage());
    }

    /**
     * 运行时异常处理方法
     *
     * @param e
     * @return
     */
    @ExceptionHandler(RuntimeException.class)
    public ResponseResult error(RuntimeException e) {
        e.printStackTrace();
        return ResponseResult.error(e.getMessage());
    }

    @ExceptionHandler(NoSuchElementException.class)
    public ResponseResult error() {
        return ResponseResult.error("无值存在");
    }

    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseResult error(IllegalArgumentException e) {
        return ResponseResult.error(e.getMessage());
    }
}
