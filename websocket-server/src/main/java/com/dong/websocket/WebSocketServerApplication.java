package com.dong.websocket;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class WebSocketServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(WebSocketServerApplication.class, args);
    }

}
