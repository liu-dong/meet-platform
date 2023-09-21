package com.dong.websocket.config;

import cn.hutool.json.JSONUtil;
import com.dong.websocket.model.MessageDTO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;

/**
 * @author LD
 */
@ServerEndpoint("/websocket/{username}")
@Component
public class WebSocketServer {


    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;

    /**
     * 服务端发送消息给客户端
     *
     * @param message
     * @throws IOException
     */
    public void sendMessage(String message) throws IOException {
        this.session.getBasicRemote().sendText(message);
    }

    @OnOpen
    public void onOpen(Session session, @PathParam("username") String username) {
        this.session = session;
        ServerManagement.add(this, username);
    }

    /**
     * 服务端接收来自客户端的消息
     *
     * @param message
     * @param username
     */
    @OnMessage
    public void onMessage(String message, @PathParam("username") String username) {
        MessageDTO messageDTO = JSONUtil.toBean(message, MessageDTO.class);
        String msg = "来自客户端" + username + "的消息:" + messageDTO.getMessageContent();
        System.out.println(msg);
        if (StringUtils.isNotBlank(messageDTO.getRecipient())) {
            ServerManagement.sendAll(msg);
        } else {
            ServerManagement.sendAllByUsername(msg, messageDTO.getRecipient());
        }
    }

    @OnError
    public void onError(Session session, Throwable error) {
        System.out.println("发生错误");
        error.printStackTrace();
    }

    @OnClose
    public void onClose() {
        ServerManagement.remove(this);
    }
}
