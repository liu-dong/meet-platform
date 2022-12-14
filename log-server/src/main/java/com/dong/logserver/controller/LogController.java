package com.dong.logserver.controller;

import com.dong.fileserver.service.OssFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/log")
public class LogController {

    @Autowired
    private OssFileService ossFileService;

    @RequestMapping("/test")
    public String test() {
        return "log";
    }
}
