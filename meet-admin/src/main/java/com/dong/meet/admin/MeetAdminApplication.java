package com.dong.meet.admin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 后台管理系统
 *
 * @author LD
 */
@SpringBootApplication//(scanBasePackages={"com.louis.mango"}) 不加也没关系，springboot会默认扫描启动类的当前包及子包
public class MeetAdminApplication {

    public static void main(String[] args) {
        SpringApplication.run(MeetAdminApplication.class, args);
    }

}
