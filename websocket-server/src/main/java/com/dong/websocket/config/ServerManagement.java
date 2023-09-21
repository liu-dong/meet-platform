package com.dong.websocket.config;

import com.dong.commoncore.exception.WebSocketException;

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
        sendAll("有新连接加入！接入人是：" + username + "当前总连接数是：" + servers.size());
        System.out.println("有新连接加入！ 当前总连接数是：" + servers.size());
    }

    /**
     * 移除连接
     *
     * @param server
     */
    public static void remove(WebSocketServer server) {
        servers.removeIf(hashMap -> server.equals(hashMap.get("server")));
        System.out.println("有连接退出！ 当前总连接数是：" + servers.size());
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
    public static void sendAllByUsername(String msg, String username) {
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


}
