package com.dong.meet.admin.controller;

import com.dong.meet.admin.service.LoginService;
import com.dong.meet.admin.vo.LoginInfoBean;
import com.dong.meet.common.http.HttpResult;
import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private LoginService loginService;

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
     * 登录
     * @param bean
     * @param request
     * @return
     */
    @PostMapping(value = "/login")
    public HttpResult login(@RequestBody LoginInfoBean bean, HttpServletRequest request) {
        return loginService.login(bean,request);
    }

    @PostMapping(value = "/hi")
    public HttpResult hi(){
        System.out.println("111111111111111111");
        return HttpResult.ok();
    }
}
