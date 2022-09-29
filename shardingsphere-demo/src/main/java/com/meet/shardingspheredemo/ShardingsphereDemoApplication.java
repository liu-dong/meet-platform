package com.meet.shardingspheredemo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;

@EntityScan(basePackages = "com.meet.**.entity")
@ComponentScan(basePackages = "com.meet.**")
@SpringBootApplication
public class ShardingsphereDemoApplication {

    public static void main(String[] args) {
        try {
            SpringApplication.run(ShardingsphereDemoApplication.class, args);
        } catch (Exception e){
            e.printStackTrace();
        }
    }

}
