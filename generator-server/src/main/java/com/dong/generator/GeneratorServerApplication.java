package com.dong.generator;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan(basePackages = {"com.dong.commoncore.exception", "com.dong.commoncore.config", "com.dong.commoncore.advice", "com.dong.generator"})
@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
public class GeneratorServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(GeneratorServerApplication.class, args);
    }

}
