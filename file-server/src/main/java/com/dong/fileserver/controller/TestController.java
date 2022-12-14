package com.dong.fileserver.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/test")
public class TestController {

    @Value("${platform.common}")
    private String common;

    @RequestMapping("/test")
    public String test() {

        return common + " hello!";

    }
}
