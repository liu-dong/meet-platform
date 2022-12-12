package com.dong.commoncore.util;

import cn.hutool.crypto.SecureUtil;

import java.security.KeyPair;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.util.Base64;

/**
 * @author liudong 2022/6/14
 */
public class RSA {


    /**
     * 获取键值对
     *
     * @return 第一位为私钥，第二位为公钥
     */
    public static String[] getKeyPair() {
        String[] result = new String[2];
        KeyPair pair = SecureUtil.generateKeyPair("RSA");
        RSAPrivateKey privateKey = (RSAPrivateKey) pair.getPrivate();
        RSAPublicKey publicKey = (RSAPublicKey) pair.getPublic();
        result[0] = Base64.getEncoder().encodeToString(privateKey.getEncoded());
        result[1] = Base64.getEncoder().encodeToString(publicKey.getEncoded());
        return result;
    }

    public static void main(String[] args) {
        String[] keyPair = RSA.getKeyPair();
        System.out.println(keyPair[0]);
        System.out.println(keyPair[1]);
    }
}
