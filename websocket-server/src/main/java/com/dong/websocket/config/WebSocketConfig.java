package com.dong.websocket.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketTransportRegistration;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

/**
 * @author LD
 */
@Configuration
//@EnableWebSocketMessageBroker //开启websocket的支持，使用STOMP协议来传输消息。
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

    //注册STOMP协议节点endpoint，并映射指定的URL。
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {

    }

    //配置消息代理
    @Override
    public void configureWebSocketTransport(WebSocketTransportRegistration registry) {
        //广播式应该配置一个topic代理
    }

    /**
     * ServerEndpointExporter 作用
     * 这个Bean会自动注册使用@ServerEndpoint注解声明的websocket endpoint
     *
     * @return
     */
    @Bean
    public ServerEndpointExporter serverEndpointExporter() {
        return new ServerEndpointExporter();
    }
}
