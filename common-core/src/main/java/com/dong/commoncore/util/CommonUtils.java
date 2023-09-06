package com.dong.commoncore.util;

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
}
