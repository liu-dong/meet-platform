package com.dong.log.web.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/log")
public class LogController {


    @RequestMapping("/test")
    public String test() {
        return "log";
    }
}
