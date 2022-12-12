package com.dong.commoncore.util;

import org.apache.commons.beanutils.ConvertUtils;
import org.springframework.util.StringUtils;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.*;

/**
 * @author LD
 * 公共工具类
 */
@SuppressWarnings("ALL")
public class CommonUtils {

    /**
     * 获取32位无字母与数字组合的uuid
     *
     * @return
     */
    public static String getUUID() {
        UUID uuid = UUID.randomUUID();
        return uuid.toString().replaceAll("-", "");
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
            e.printStackTrace();
        }
        return result;
    }

    /**
     * Map转Object
     *
     * @param object
     * @return
     */
    public static Object mapToObject(Map<String, Object> map) throws IllegalAccessException {
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
    }

    /**
     * Map转Object
     *
     * @param object
     * @return
     */
    public static <T> T mapToObject(Map<String, Object> map, Class<T> clazz) {
        if (map == null) {
            return null;
        }
        T t = null;
        Field[] fields = clazz.getDeclaredFields();
        try {
            t = clazz.newInstance();
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
        } catch (InstantiationException | IllegalAccessException e) {
            e.printStackTrace();
            System.err.println("map转换指定对象异常");
        }
        return t;
    }

    /**
     * 列表转成树结构
     *
     * @param listMap
     * @return
     */
    public static List<Map<String, Object>> listToTreeByRecursive(List<Map<String, Object>> listMap) {
        List<Map<String, Object>> result = new ArrayList<>();
        for (Map<String, Object> map : listMap) {
            if (StringUtils.isEmpty(map.get("parentId"))) {
                result.add(findChildrenList(listMap, map));
            }
        }
        return result;
    }

    /**
     * 递归遍历生成树结构
     *
     * @param list     全部数据集合
     * @param children 子节点对象
     * @return
     */
    public static Map<String, Object> findChildrenList(List<Map<String, Object>> list, Map<String, Object> children) {
        List<Map<String, Object>> childrenList = new ArrayList<>();
        for (Map<String, Object> map : list) {
            if (children.get("id").equals(map.get("parentId"))) {//找出所有子节点
                childrenList.add(findChildrenList(list, map));
                children.put("children", childrenList);
            }
        }
        return children;
    }

    /**
     * 获得随机六位数
     *
     * @return
     */
    public static String getRandomSixNum() {
        Random random = new Random();
        int number = random.nextInt(999999);
        return String.format("%06d", number);
    }

    public static void main(String[] args) {
        //List<Map<String, Object>> listMap = new ArrayList<>();
        //for (int i = 1; i <= 10; i++) {
        //    Map<String, Object> map = new HashMap<>();
        //    map.put("id", String.valueOf(i));
        //    map.put("parentId", "");
        //    listMap.add(map);
        //}
        //for (int i = 1; i <= 10; i++) {
        //    Map<String, Object> map = new HashMap<>();
        //    map.put("id", String.valueOf(i + 10 * i));
        //    map.put("parentId", String.valueOf(i));
        //    listMap.add(map);
        //}
        //for (int i = 1; i <= 10; i++) {
        //    Map<String, Object> map = new HashMap<>();
        //    map.put("id", String.valueOf(i + 10 * i + 100 * i));
        //    map.put("parentId", String.valueOf(i + 10 * i));
        //    listMap.add(map);
        //}
        //List<Map<String, Object>> treeList = listToTreeByRecursive(listMap);
        //System.out.println(treeList.toString());
    }

    public static int computer(int sum, int num) {
        return sum + num;
    }
}
