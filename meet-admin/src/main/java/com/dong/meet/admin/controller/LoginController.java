package com.dong.meet.admin.controller;

import com.dong.meet.admin.vo.LoginInfoBean;
import com.dong.meet.common.http.HttpResult;
import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * 登录模块
 * @author 3hld
 * @date 2020/1/6 15:30
 * @Version 1.0
 */
@RestController
public class LoginController {

    @Resource
    private Producer producer;

    /**
     * 动态生成验证码
     * @param response
     * @param request
     * @throws IOException
     */
    @GetMapping("captcha.jpg")
    public void captcha(HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setHeader("Cache-Control", "no-store, no-cache");
        response.setContentType("image/jpeg");
        // 生成文字验证码
        String text = producer.createText();
        // 生成图片验证码
        BufferedImage image = producer.createImage(text);
        // 保存到验证码到 session
        request.getSession().setAttribute(Constants.KAPTCHA_SESSION_KEY, text);
        ServletOutputStream out = response.getOutputStream();
        //使用支持给定格式的任意 ImageWriter写入图像到 File 。
        ImageIO.write(image, "jpg", out);
        IOUtils.closeQuietly(out);
    }

    /**
     * 登录方法
     * @param bean
     * @param request
     * @return
     */
    @PostMapping(value = "/login")
    public HttpResult login(@RequestBody LoginInfoBean bean, HttpServletRequest request) {
        String usernameD = "admin";
        String passwordD = "123456";
        String username = bean.getUsername();
        String password = bean.getPassword();
        String captcha = bean.getCaptcha();
        // 从session中获取之前保存的验证码跟前台传来的验证码进行匹配
        Object kaptcha = request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
        if(kaptcha == null){
            return HttpResult.error("验证码已失效");
        }
        if(!captcha.equals(kaptcha)){
            return HttpResult.error("验证码不正确");
        }
        if (!usernameD.equals(username) && passwordD.equals(password)){
            return HttpResult.error("登录失败");
        }
        // 用户信息
//        SysUser user = sysUserService.findByName(username);
        // 账号不存在、密码错误
        /*if (user == null) {
            return HttpResult.error("账号不存在");
        }*/
        /*if (!PasswordUtils.matches(user.getSalt(), password, user.getPassword())) {
            return HttpResult.error("密码不正确");
        }*/
        // 账号锁定
        /*if (user.getStatus() == 0) {
            return HttpResult.error("账号已被锁定,请联系管理员");
        }*/
        // 系统登录认证
//        JwtAuthenticationToken token = SecurityUtils.login(request, username, password, authenticationManager);
        return HttpResult.ok();
    }
}
