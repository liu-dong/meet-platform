package com.dong.commoncore.util;

import com.dong.commoncore.exception.GlobalException;

import java.io.*;

/**
 * 对象工具类
 *
 * @author liudong
 * @date 2023/9/5
 */
public class ObjectUtils {

    /**
     * 序列化
     *
     * @param object
     * @return
     */
    private static byte[] serialize(Object object) {
        try {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            ObjectOutputStream objectOutputStream = new ObjectOutputStream(byteArrayOutputStream);
            objectOutputStream.writeObject(object);
            return byteArrayOutputStream.toByteArray();
        } catch (IOException e) {
            throw new GlobalException("对象序列化异常：" + e);
        }
    }

    /**
     * 反序列化
     *
     * @param binaryByte
     * @return
     */
    private static Object deserialize(byte[] binaryByte) {
        try {
            ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(binaryByte);
            ObjectInputStream objectInputStream = new ObjectInputStream(byteArrayInputStream);
            return objectInputStream.readObject();
        } catch (IOException | ClassNotFoundException e) {
            throw new GlobalException("对象反序列化异常：" + e);
        }
    }
}
