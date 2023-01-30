package com.dong.cacheserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
public class CacheServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(CacheServerApplication.class, args);
    }

}
