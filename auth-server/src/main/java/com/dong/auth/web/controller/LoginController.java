package com.dong.auth.web.controller;

import com.dong.auth.web.model.LoginDTO;
import com.dong.auth.web.service.LoginService;
import com.dong.auth.web.service.SecurityCodeService;
import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.ResponseResult;
import com.dong.user.model.dto.RegisterDTO;
import com.dong.user.service.AccountService;
import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * 登录注册
 *
 * @author LD 2021/5/18
 */
@RestController
public class LoginController {

    @Autowired
    Producer producer;
    @Autowired
    LoginService loginService;
    @Autowired
    AccountService accountService;
    @Autowired
    SecurityCodeService securityCodeService;

    /**
     * 动态生成验证码
     *
     * @param response
     * @param request
     * @throws IOException
     */
    @GetMapping("/getKaptcha")
    public void getKaptcha(HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setHeader("Cache-Control", "no-store, no-cache");
        response.setContentType("image/jpeg");
        // 生成文字验证码
        String text = producer.createText();
        // 生成图片验证码
        BufferedImage image = producer.createImage(text);
        // 保存验证码到 session
        request.getSession().setAttribute(Constants.KAPTCHA_SESSION_KEY, text);
        // 保存验证码到 cookies
        Cookie cookie = new Cookie("kaptcha", text);
        response.addCookie(cookie);
        ServletOutputStream out = response.getOutputStream();
        // 使用支持给定格式的任意 ImageWriter写入图像到 File 。
        ImageIO.write(image, "jpg", out);
        try {
            out.flush();
        } finally {
            out.close();
        }
    }


    /**
     * 获取验证码
     *
     * @param number
     */
    @PostMapping("/getSecurityCode")
    public ResponseResult<String> getSecurityCode(String number) {
        String code = securityCodeService.sendSecurityCode(number);
        return ResponseResult.success(code, ResponseMessageConstant.OPERATE_SUCCESS);
    }


    /**
     * 登录
     *
     * @param dto
     * @return
     */
    @PostMapping("/login")
    public ResponseResult<?> login(HttpServletRequest request, @RequestBody LoginDTO dto) {
        String result = loginService.login(request, dto);
        if (StringUtils.isEmpty(result)) {
            return ResponseResult.error("登录失败！");
        } else {
            return ResponseResult.success(result, "登录成功！");
        }
    }


    /**
     * 退出登录
     *
     * @return 返回结果
     */
    @PostMapping("/logout")
    public ResponseResult<?> logout(HttpServletRequest request) {
        loginService.logout(request);
        return ResponseResult.success(ResponseMessageConstant.LOGOUT_SUCCESS);
    }

    /**
     * 注册用户
     *
     * @param dto
     * @return
     */
    @PostMapping("/register")
    public ResponseResult<String> register(@RequestBody RegisterDTO dto) {
        String username = accountService.register(dto);
        return ResponseResult.success(username, ResponseMessageConstant.REGISTER_SUCCESS);
    }

    /**
     * 修改密码
     *
     * @param username
     * @param password
     * @return
     */
    @PostMapping("/updatePassword")
    public ResponseResult<String> updatePassword(String username, String password) {
        accountService.updatePassword(username, password);
        return ResponseResult.success(username, ResponseMessageConstant.OPERATE_SUCCESS);
    }

}
