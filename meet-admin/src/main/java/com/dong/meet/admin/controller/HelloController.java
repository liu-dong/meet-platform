package com.dong.meet.admin.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * demo
 *
 * @author LD
 * @date 2019/12/30 10:56
 */
@RestController
public class HelloController {

    /**
     * 测试基本框架是否成功配置
     *
     * @return
     */
    @RequestMapping(value = "/hello")
    public String hello() {
        return "Hello World!";
    }

    /**
     * 遇见
     *
     * @return
     */
    @RequestMapping(value = "/meet")
    public String meet() {
        return "How too meet you!";
    }
}
