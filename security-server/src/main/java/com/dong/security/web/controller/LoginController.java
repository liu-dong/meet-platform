package com.dong.security.web.controller;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.ResponseResult;
import com.dong.security.web.model.RegisterDTO;
import com.dong.security.web.service.UserService;
import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
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
@Api(tags = "登录注册")
@RestController
// @RequestMapping("/security")
public class LoginController {

    @Autowired
    Producer producer;
    @Autowired
    UserService userService;

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
        // 使用支持给定格式的任意 ImageWriter写入图像到 File 。
        ImageIO.write(image, "jpg", out);
        try {
            out.flush();
        } finally {
            out.close();
        }
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
        String username = userService.register(dto);
        return ResponseResult.success(username, ResponseMessageConstant.REGISTER_SUCCESS);
    }

}
