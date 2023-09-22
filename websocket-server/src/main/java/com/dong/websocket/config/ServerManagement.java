package com.dong.websocket.config;

import com.dong.commoncore.exception.WebSocketException;
import org.jetbrains.annotations.NotNull;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;

/**
 * 维护了一个线程安全的集合servers, 用于因为浏览器发起连接请求而创建的BitCoinServer.
 *
 * @author LD
 */
public class ServerManagement {

    /**
     * 维护了一个线程安全的集合servers, 用于因为浏览器发起连接请求而创建的BitCoinServer.
     */
    private static final Collection<HashMap<String, Object>> servers = Collections.synchronizedCollection(new ArrayList<>());

    /**
     * 添加连接
     *
     * @param server
     * @param username
     */
    public static void add(WebSocketServer server, String username) {
        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("server", server);
        hashMap.put("username", username);
        servers.add(hashMap);
        String msg = getMessageTemplate("login", username);
        sendAll(msg);
        System.out.println("有新连接加入！ 当前总连接数是：" + servers.size());
    }

    /**
     * 移除连接
     *
     * @param server
     */
    public static void remove(WebSocketServer server) {
        String username = getUsername(server);
        servers.removeIf(hashMap -> server.equals(hashMap.get("server")));
        String msg = getMessageTemplate("logout", username);
        sendAll(msg);
        System.out.println(msg);
    }

    /**
     * 广播式
     *
     * @param msg
     */
    public static void sendAll(String msg) {
        for (HashMap<String, Object> server : servers) {
            try {
                WebSocketServer webSocketServer = (WebSocketServer) server.get("server");
                webSocketServer.sendMessage(msg);
            } catch (IOException e) {
                e.printStackTrace();
                throw new WebSocketException(e.getMessage());
            }
        }
    }

    /**
     * 点对点式
     *
     * @param msg
     * @param username
     */
    public static void sendTo(String msg, String username) {
        for (HashMap<String, Object> server : servers) {
            try {
                WebSocketServer webSocketServer = (WebSocketServer) server.get("server");
                if (username.equals(server.get("username"))) {
                    webSocketServer.sendMessage(msg);
                }
            } catch (IOException e) {
                e.printStackTrace();
                throw new WebSocketException(e.getMessage());
            }
        }
    }

    /**
     * 获取连接数
     *
     * @return
     */
    public static int getTotal() {
        return servers.size();
    }

    public static String getUsername(WebSocketServer server) {
        for (HashMap<String, Object> hashMap : servers) {
            WebSocketServer currentServer = (WebSocketServer) hashMap.get("server");
            if (currentServer == server) {
                return (String) hashMap.get("username");
            }
        }
        return "空";
    }

    @NotNull
    private static String getMessageTemplate(String messageType, String username) {
        String message = "";
        if ("login".equals(messageType)) {
//        String msg = "有新连接加入！接入人是：" + username + "，当前总连接数是：" + servers.size();
            message = "有用户登录！登录人是：" + username + "，当前在线人数：" + servers.size() + "人";
        }
        if ("logout".equals(messageType)) {
//            String logoutMessages = "有连接退出！ 当前总连接数是：" + servers.size();
            message = username + "用户退出！ 当前在线人数：" + servers.size();
        }
        return message;
    }

}
