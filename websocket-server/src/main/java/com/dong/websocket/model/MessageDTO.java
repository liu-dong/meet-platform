package com.dong.websocket.model;

import lombok.Data;

/**
 * 消息体
 *
 * @author LD
 */
@Data
public class MessageDTO {

    private String messageContent;//消息内容
    private String recipient;//接收者

}
