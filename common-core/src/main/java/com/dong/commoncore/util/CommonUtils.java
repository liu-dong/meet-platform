package com.dong.commoncore.util;

import com.dong.commoncore.constant.SymbolConstant;
import org.springframework.util.StringUtils;

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

    /**
     * 转为驼峰
     *
     * @param name 名称
     * @return 返回转换后的字段名
     */
    public static String toCamel(String name) {
        StringBuilder result = new StringBuilder();
        name = name.toLowerCase();
        if (!name.contains(SymbolConstant.UNDERLINE)) {
            // 不含下划线，仅将首字母小写
            return name;
        } else {
            String[] string = name.split(SymbolConstant.UNDERLINE);
            for (int i = 0; i < string.length; i++) {
                if (i > 0) {
                    string[i] = string[i].substring(0, 1).toUpperCase() + string[i].substring(1);
                }
                result.append(string[i]);
            }
        }
        return result.toString();
    }

    /**
     * 转为大驼峰（即首字母大写）
     *
     * @param name 名称
     * @return 返回转换后的字段名
     */
    public static String toUpperCamel(String name) {
        String result = toCamel(name);
        return result.substring(0, 1).toUpperCase() + result.substring(1);
    }

    public static String jointLike(String name) {
        return SymbolConstant.PERCENT + name + SymbolConstant.PERCENT;
    }

    public static String jointLikeLeft(String name) {
        return SymbolConstant.PERCENT + name;
    }

    public static String jointLikeRight(String name) {
        return name + SymbolConstant.PERCENT;
    }
}
