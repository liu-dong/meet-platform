package com.meet.commoncore.util;

import com.rabbitmq.client.*;

import java.io.IOException;
import java.net.URISyntaxException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeoutException;

/**
 * rabbitmq
 *
 * @author LD
 */
public class RabbitMQUtil {

    private static final String ADDRESSES = "192.168.154.127";
    private static final int PORT = 5672;
    private static final String USERNAME = "admin";
    private static final String PASSWORD = "123456";
    private static final String VIRTUAL_HOST = "/";
    private static final Integer CONNECTION_TIMEOUT = 15000;

    /**
     * 连接RabbitMQ
     *
     * @return
     * @throws IOException
     * @throws TimeoutException
     */
    public static Connection connFirst() throws IOException, TimeoutException {
        ConnectionFactory factory = new ConnectionFactory();
        factory.setUsername(USERNAME);
        factory.setPassword(PASSWORD);
        factory.setVirtualHost(VIRTUAL_HOST);
        factory.setHost(ADDRESSES);
        factory.setPort(PORT);
        factory.setConnectionTimeout(CONNECTION_TIMEOUT);
        return factory.newConnection();
    }

    /**
     * 连接RabbitMQ
     *
     * @return
     * @throws IOException
     * @throws TimeoutException
     */
    public static Connection connSecond() throws NoSuchAlgorithmException, KeyManagementException, URISyntaxException, IOException, TimeoutException {
        ConnectionFactory factory = new ConnectionFactory();
//        要链接到“/”的vhost，正确的链接应该要在尾部加上“%2f”
        factory.setUri("amqp://" + USERNAME + ":" + PASSWORD + "@" + ADDRESSES + ":" + PORT + "/%2f");
        return factory.newConnection();

    }

    /**
     * 声明交换器
     */
    public static Channel exchangeDeclare() throws URISyntaxException, IOException, TimeoutException, NoSuchAlgorithmException, KeyManagementException {
        Connection conn = connSecond();
        Channel channel = conn.createChannel();
        channel.exchangeDeclare("meet-exchange", "topic", true);//声明交换器
        channel.queueDeclare("meet-queue", true, false, false, null);//声明队列
//        String queue = channel.queueDeclare().getQueue();
        channel.queueBind("meet-queue", "meet-exchange", "meet.dong");//绑定
        return channel;
    }

    /**
     * 发送消息
     *
     * @throws IOException
     * @throws TimeoutException
     * @throws NoSuchAlgorithmException
     * @throws KeyManagementException
     * @throws URISyntaxException
     */
    public static void sendMessage() throws IOException, TimeoutException, NoSuchAlgorithmException, KeyManagementException, URISyntaxException {
        Channel channel = exchangeDeclare();
        String message = "hello world！！！";
        channel.basicPublish("meet-exchange", "meet.dong", null, message.getBytes());
//        channel.basicPublish("meet-exchange", "meet.dong",
//                new AMQP.BasicProperties.Builder()
//                .contentType("text/plain")
//                .deliveryMode(2)
//                .priority(1)
//                .userId("hidden")
//                .build(), message.getBytes());

    }

    /**
     * 推模式接收消息
     *
     * @throws IOException
     * @throws TimeoutException
     * @throws NoSuchAlgorithmException
     * @throws KeyManagementException
     * @throws URISyntaxException
     */
    public static void receiveMessagePush() throws IOException, TimeoutException, NoSuchAlgorithmException, KeyManagementException, URISyntaxException {
        Channel channel = exchangeDeclare();
        boolean autoAck = false;
        channel.basicQos(64);
        String consume = channel.basicConsume("meet-queue", autoAck, "myConsumerTag", new DefaultConsumer(channel) {
            @Override
            public void handleDelivery(String consumerTag, Envelope envelope, AMQP.BasicProperties properties, byte[] body) throws IOException {
                String routingKey = envelope.getRoutingKey();
                String contentType = properties.getContentType();
                long deliveryTag = envelope.getDeliveryTag();//消息的编号，64位的长整数
                System.out.println(consumerTag + ":" + routingKey + ":" + contentType + ":" + deliveryTag);
                channel.basicAck(deliveryTag, false);
//                super.handleDelivery(consumerTag, envelope, properties, body);
            }
        });
        System.out.println(consume);

    }

    /**
     * 拉模式接收消息
     *
     * @throws IOException
     * @throws TimeoutException
     * @throws NoSuchAlgorithmException
     * @throws KeyManagementException
     * @throws URISyntaxException
     */
    public static void receiveMessageGet(String queueName) throws IOException, TimeoutException, NoSuchAlgorithmException, KeyManagementException, URISyntaxException {
        Channel channel = exchangeDeclare();
        boolean autoAck = false;
        GetResponse getResponse = channel.basicGet(queueName, autoAck);
        byte[] body = getResponse.getBody();
        System.out.println(new String(body));
        channel.basicAck(getResponse.getEnvelope().getDeliveryTag(), false);
    }

    public static void getReturnMessage() throws URISyntaxException, KeyManagementException, TimeoutException, NoSuchAlgorithmException, IOException {
        Channel channel = exchangeDeclare();
        String message = "hello world！";
        channel.basicPublish("meet-exchange", "", true, MessageProperties.PERSISTENT_TEXT_PLAIN, message.getBytes());
        channel.addReturnListener(new ReturnListener() {
            @Override
            public void handleReturn(int i, String s, String s1, String s2, AMQP.BasicProperties basicProperties, byte[] bytes) throws IOException {
                String message = new String(bytes);
                System.out.println(message);
            }
        });
    }

    public static void alternateExchange() throws TimeoutException, IOException {
        Channel channel = connFirst().createChannel();
        Map<String, Object> args = new HashMap<>();
        args.put("alternate-exchange", "alternate-exchange");
        channel.exchangeDeclare("normal-exchange", "direct", true, false, args);//声明普通交换器
        channel.exchangeDeclare("alternate-exchange", "fanout", true, false, null);//声明备份交换器
        channel.queueDeclare("norma1-queue", true, false, false, null);//声明队列
        channel.queueBind("norma1-queue", "normal-exchange", "normal.dong");//绑定
        channel.queueDeclare("unroute-queue", true, false, false, null);//声明队列
        channel.queueBind("unroute-queue", "alternate-exchange", "");//绑定

        String message = "hello world！";
        channel.basicPublish("normal-exchange", "error.dong", null, message.getBytes());
    }

    @SuppressWarnings("AlibabaLowerCamelCaseVariableNaming")
    public static void setTTL1() throws TimeoutException, IOException {
        Channel channel = connFirst().createChannel();
        Map<String, Object> args = new HashMap<>();
        args.put("alternate-exchange", "alternate-exchange");
        channel.exchangeDeclare("alternate-exchange", "fanout", true, false, null);//声明备份交换器
        Map<String, Object> arguments = new HashMap<>();
        args.put("x-expires", 6000);
        channel.exchangeDeclare("normal-exchange", "direct", true, false, args);//声明普通交换器
        channel.queueDeclare("norma1-queue", false, false, false, arguments);//声明队列
        channel.queueBind("norma1-queue", "normal-exchange", "normal.dong");//绑定
        channel.queueBind("unroute-queue", "alternate-exchange", "");//绑定

        String message = "hello world！";
        channel.basicPublish("normal-exchange", "normal.dong", null, message.getBytes());
    }

    @SuppressWarnings("AlibabaLowerCamelCaseVariableNaming")
    public static void sendDLX() throws TimeoutException, IOException {
        Channel channel = connFirst().createChannel();
        String message = "hello world！";
        channel.exchangeDeclare("dlx-exchange", "direct", true);//声明死信交换器
        channel.exchangeDeclare("normal-exchange", "fanout", true);//声明普通交换器
        Map<String, Object> arguments = new HashMap<>();
        arguments.put("x-message-ttl", 6000);
        arguments.put("x-dead-letter-exchange", "dlx-exchange");
        arguments.put("x-dead-letter-routing-key", "dlx.dong");
        channel.queueDeclare("norma1-queue", false, false, false, arguments);//声明普通队列
        channel.queueBind("norma1-queue", "normal-exchange", "normal.dong");//普通队列绑定

        channel.queueDeclare("dlx-queue", true, false, false, null);//声明死信队列
        channel.queueBind("dlx-queue", "dlx-exchange", "dlx.dong");//死信队列绑定
        channel.basicPublish("normal-exchange", "normal.dong", null, message.getBytes());
    }

    public static void delay(String delaysTime) throws TimeoutException, IOException {
        Channel channel = connFirst().createChannel();
        String message = "hello world！";
        String dlxExchange = "dlx-exchange-" + delaysTime;
        String normalExchange = "normal-exchange-" + delaysTime;
        String dlxQueue = "dlx-queue-" + delaysTime;
        String normalQueue = "normal-queue-" + delaysTime;
        String dlxRouterKey = "dlx.dong." + delaysTime;
        String normalRouterKey = "normal.dong." + delaysTime;
        channel.exchangeDeclare(dlxExchange, "direct", true, true, false, null);//声明死信交换器
        channel.exchangeDeclare(normalExchange, "fanout", true, true, false, null);//声明普通交换器
        Map<String, Object> arguments = new HashMap<>();
        arguments.put("x-message-ttl", Integer.parseInt(delaysTime) * 1000);
        arguments.put("x-dead-letter-exchange", dlxExchange);
        arguments.put("x-dead-letter-routing-key", dlxRouterKey);
        channel.queueDeclare(normalQueue, false, false, false, arguments);//声明普通队列
        channel.queueBind(normalQueue, normalExchange, normalRouterKey);//普通队列绑定
        channel.queueDeclare(dlxQueue, true, false, false, null);//声明死信队列
        channel.queueBind(dlxQueue, dlxExchange, dlxRouterKey);//死信队列绑定
        channel.basicPublish(normalExchange, normalRouterKey, null, message.getBytes());
    }

    public static void delayGroup() throws TimeoutException, IOException {
        delay("3");
        delay("5");
        delay("10");
        delay("30");
        delay("60");
    }


    /*public static void main(String[] args) throws URISyntaxException, KeyManagementException, TimeoutException, NoSuchAlgorithmException, IOException {
//        try {
//            Connection connection1 = connFirst();
////            connection1.close();
//            Connection connection2 = connSecond();
////            connection2.close();
//        } catch (NoSuchAlgorithmException | KeyManagementException | URISyntaxException | IOException | TimeoutException e) {
//            e.printStackTrace();
//        }
//        sendMessage();
//        getReturnMessage();
//        setTTL1();
//        receiveMessageGet("norma1-queue");
//        sendDLX();
        delayGroup();
    }*/

}
