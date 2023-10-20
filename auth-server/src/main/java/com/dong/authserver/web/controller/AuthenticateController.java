package com.dong.authserver.web.controller;

import com.dong.authserver.web.model.LoginDTO;
import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.util.JWTUtils;
import com.dong.security.core.model.vo.UserDetailsVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Security认证
 *
 * @author LD 2021/5/18
 */
@RestController
public class AuthenticateController {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    UserDetailsService userDetailsService;

    /**
     * 认证
     *
     * @param dto
     * @return
     */
    @PostMapping("/authenticate")
    public ResponseResult authenticate(LoginDTO dto) {
        authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(dto.getUsername(), dto.getPassword()));
        UserDetailsVO userDetails = (UserDetailsVO) userDetailsService.loadUserByUsername(dto.getUsername());
        String token = JWTUtils.getToken(userDetails.getUserId(), userDetails.getUsername(), userDetails.getRealName());
        if (StringUtils.isEmpty(token)) {
            return ResponseResult.error("登录失败！");
        } else {
            return ResponseResult.success(token, "登录成功！");
        }
    }
}
