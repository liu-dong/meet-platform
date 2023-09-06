package com.dong.commoncore.util;

import com.dong.commoncore.exception.GlobalException;
import org.apache.commons.beanutils.ConvertUtils;

import java.io.*;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.Map;

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

    /**
     * Object转Map
     *
     * @param object
     * @return
     */
    public static Map<String, Object> objectToMap(Object object) {
        Map<String, Object> result = new HashMap<>();
        Field[] fields = object.getClass().getDeclaredFields();
        try {
            for (Field field : fields) {
                String name = field.getName();
                Field f = object.getClass().getDeclaredField(name);
                f.setAccessible(true);
                if (f.get(object) != null) {
                    result.put(name, f.get(object).toString());
                } else {
                    result.put(name, null);
                }
            }
        } catch (Exception e) {
            throw new GlobalException("对象转换异常：" + e);
        }
        return result;
    }

    /**
     * Map转Object
     *
     * @param map
     * @return
     */
    public static Object mapToObject(Map<String, Object> map) {
        try {
            Object object = new Object();
            Field[] fields = object.getClass().getDeclaredFields();
            for (Field field : fields) {
                int mod = field.getModifiers();
                if (Modifier.isFinal(mod) || Modifier.isStatic(mod)) {
                    continue;
                }
                field.setAccessible(true);
                field.set(object, map.get(field.getName()));

            }
            return object;
        } catch (IllegalAccessException e) {
            throw new GlobalException("对象转换异常：" + e);
        }
    }

    /**
     * Map转Object
     *
     * @param map
     * @param clazz
     * @param <T>
     * @return
     */
    public static <T> T mapToObject(Map<String, Object> map, Class<T> clazz) {
        if (map == null) {
            return null;
        }
        try {
            Field[] fields = clazz.getDeclaredFields();
            T t = clazz.newInstance();
            for (Field field : fields) {
                if (map.containsKey(field.getName())) {
                    boolean flag = field.isAccessible();
                    field.setAccessible(true);
                    Object object = map.get(field.getName());
                    //&& field.getType().isAssignableFrom(object.getClass())
                    if (object != null) {
                        field.set(t, ConvertUtils.convert(object, field.getType()));
                    }
                    field.setAccessible(flag);
                }
            }
            return t;
        } catch (InstantiationException | IllegalAccessException e) {
            throw new GlobalException("对象转换异常：" + e);
        }
    }
}
