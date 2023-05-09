package com.dong.productservice.consumer;

import com.dong.productservice.web.service.ProductService;
import com.rabbitmq.client.Channel;
import org.springframework.amqp.rabbit.annotation.*;
import org.springframework.amqp.support.AmqpHeaders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.Headers;
import org.springframework.messaging.handler.annotation.Payload;

import java.io.IOException;
import java.util.Map;

/**
 * @author LD
 */
//@Component
public class OrderReceiver {

    @Autowired
    private ProductService productService;

    //配置监听的哪一个队列，同时在没有queue和exchange的情况下会去创建并建立绑定关系
    @RabbitListener(bindings = @QueueBinding(
            value = @Queue(value = "order-queue", durable = "true"),
            exchange = @Exchange(name = "order-exchange", type = "topic"),
            key = "order.*"
    )
    )
    @RabbitHandler
    public void onOrderMessage(@Payload Map map, @Headers Map<String, Object> headers, Channel channel) throws IOException {
        //消费者操作
        System.out.println("---------收到消息，开始消费---------");
        System.out.println("商品名称：" + map.get("productName"));
        System.out.println("商品数量：" + map.get("productCount"));
        productService.updateProductCount((String) map.get("productName"),(int) map.get("productCount"));
        /**
         * Delivery Tag 用来标识信道中投递的消息。RabbitMQ 推送消息给 Consumer 时，会附带一个 Delivery Tag，
         * 以便 Consumer 可以在消息确认时告诉 RabbitMQ 到底是哪条消息被确认了。
         * RabbitMQ 保证在每个信道中，每条消息的 Delivery Tag 从 1 开始递增。
         */
        Long deliveryTag = (Long) headers.get(AmqpHeaders.DELIVERY_TAG);

        /**
         *  multiple 取值为 false 时，表示通知 RabbitMQ 当前消息被确认
         *  如果为 true，则额外将比第一个参数指定的 delivery tag 小的消息一并确认
         */

        //ACK,确认一条消息已经被消费
        channel.basicAck(deliveryTag, false);
    }

}
