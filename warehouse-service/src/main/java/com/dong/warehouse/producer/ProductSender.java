package com.dong.warehouse.producer;

import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * 商品发送
 *
 * @author LD
 */
@Component
public class ProductSender {

    @Autowired
    private RabbitTemplate rabbitTemplate;

    public void sendOrder(Map<String,Object> map) {
        rabbitTemplate.convertAndSend("order-exchange", "order.abcd", map);
    }
}
