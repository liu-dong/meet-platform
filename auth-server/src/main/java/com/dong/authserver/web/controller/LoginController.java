package com.dong.authserver.web.controller;

import com.dong.authserver.web.model.LoginDTO;
import com.dong.authserver.web.model.RegisterDTO;
import com.dong.authserver.web.service.LoginService;
import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.model.UserDetail;
import com.dong.commoncore.util.JWTUtils;
import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
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
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Map;

/**
 * 登录注册
 *
 * @author LD 2021/5/18
 */
@Api(tags = "登录注册")
@RestController
public class LoginController {

    @Autowired
    Producer producer;
    @Autowired
    LoginService loginService;

    /**
     * 动态生成验证码
     *
     * @param response
     * @param request
     * @throws IOException
     */
    @ApiOperation("获取动态生成验证码")
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
        //使用支持给定格式的任意 ImageWriter写入图像到 File 。
        ImageIO.write(image, "jpg", out);
        try {
            out.flush();
        } finally {
            out.close();
        }
    }


    /**
     * 登录
     *
     * @param dto
     * @return
     */
    @ApiOperation("登录")
    @PostMapping("/login")
    public ResponseResult login(HttpServletRequest request, @RequestBody LoginDTO dto) {
        try {
            //验证码校验
            verificationCode(request, dto);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.error(e.getMessage());
        }
        String token = loginService.login(dto);
        if (StringUtils.isEmpty(token)) {
            return ResponseResult.error("登录失败！");
        } else {
            return ResponseResult.success(token, "登录成功！");
        }
    }

    /**
     * 校验token
     *
     * @param request
     * @return
     */
    @ApiOperation("校验token")
    @GetMapping("/checkToken")
    public ResponseResult checkToken(HttpServletRequest request) {
        Map<String, String> map = JWTUtils.analyzeToken(request);
        if (map ==null){
            return ResponseResult.error("无效令牌");
        }
        return ResponseResult.success(map,"有效令牌");
    }

    /**
     * 刷新token
     *
     * @param request
     * @return
     */
    @ApiOperation("刷新token")
    @GetMapping("/refreshToken")
    public ResponseResult refreshToken(HttpServletRequest request) {
        String token = JWTUtils.refreshToken(request);
        return ResponseResult.success(token, "登录成功！");
    }

    /**
     * 获取用户信息
     *
     * @param request
     * @return
     */
    @ApiOperation("获取用户信息")
    @GetMapping("/getUserDetail")
    public ResponseResult getUserDetail(HttpServletRequest request) {
        UserDetail user = loginService.getUserDetail(request);
        return ResponseResult.success(user, "校验成功！");
    }

    /**
     * 退出登录
     *
     * @return 返回结果
     */
    @ApiOperation("退出登录")
    @PostMapping("/logout")
    public ResponseResult logout() {
        return loginService.logout();
    }

    /**
     * 注册用户
     *
     * @param dto
     * @return
     */
    @ApiOperation("注册用户")
    @PostMapping("/register")
    public ResponseResult register(@RequestBody RegisterDTO dto) {
        String username = loginService.register(dto);
        return ResponseResult.success(username, ResponseMessageConstant.REGISTER_SUCCESS);
    }

    /**
     * 注销用户
     *
     * @param username 用户名
     * @return 返回结果
     */
    @ApiOperation("注销用户")
    @PostMapping("/cancel")
    public ResponseResult cancel(String username) {
        return loginService.cancel(username);
    }

    public void verificationCode(HttpServletRequest request, LoginDTO dto) {
        String paramCaptcha = dto.getCaptcha();
        //用于开发测试
        if ("1".equals(paramCaptcha)) {
            return;
        }
        HttpSession session = request.getSession();
        String savedCode = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
        if (StringUtils.isNotBlank(savedCode)) {
            session.removeAttribute(Constants.KAPTCHA_SESSION_KEY);
        }
        if (StringUtils.isBlank(paramCaptcha) || StringUtils.isBlank(savedCode) || !paramCaptcha.equalsIgnoreCase(savedCode)) {
            throw new GlobalException(500, "验证码校验失败");
        }

    }
}
