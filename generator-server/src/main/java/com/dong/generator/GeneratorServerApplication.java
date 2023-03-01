package com.dong.generator;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan(basePackages = {"com.dong.commoncore.**", "com.dong.generator"})
@SpringBootApplication
public class GeneratorServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(GeneratorServerApplication.class, args);
    }

}
