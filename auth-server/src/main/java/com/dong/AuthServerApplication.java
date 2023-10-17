package com.dong;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

//@ComponentScan(basePackages = {"com.dong.**", "com.dong.security.config"})
//@EnableJpaRepositories(basePackages = {"com.dong.security.core.dao","com.dong.authserver.web.service"})
//@EntityScan(basePackages = {"com.dong.security.core.entity"})
@SpringBootApplication
public class AuthServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(AuthServerApplication.class, args);
    }

}
