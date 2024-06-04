package com.dong.auth.web.controller;

import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.util.JWTUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * token管理
 *
 * @author LD 2023/10/27
 */
@RestController
public class TokenController {

    /**
     * 校验token
     *
     * @param request
     * @return
     */
    @GetMapping("/checkToken")
    public ResponseResult checkToken(HttpServletRequest request) {
        Map<String, String> map = JWTUtils.analyzeToken(request);
        if (map == null) {
            return ResponseResult.error("无效令牌");
        }
        return ResponseResult.success(map, "有效令牌");
    }

    /**
     * 刷新token
     *
     * @param request
     * @return
     */
    @GetMapping("/refreshToken")
    public ResponseResult refreshToken(HttpServletRequest request) {
        String token = JWTUtils.refreshToken(request);
        return ResponseResult.success(token, "登录成功！");
    }
}
