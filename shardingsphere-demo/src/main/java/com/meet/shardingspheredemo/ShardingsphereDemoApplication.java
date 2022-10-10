package com.meet.shardingspheredemo;

import com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceAutoConfigure;
import org.apache.shardingsphere.spring.boot.ShardingSphereAutoConfiguration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;


//@EntityScan(basePackages = "com.meet.**.entity")
@ComponentScan(basePackages = "com.meet.**")
@SpringBootApplication(exclude = {ShardingSphereAutoConfiguration.class})
public class ShardingsphereDemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(ShardingsphereDemoApplication.class, args);
    }

}
