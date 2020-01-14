package com.dong.meet.common.utils;

/**
 * 密码工具 （包括密码验证、密文生成）
 *
 * @author 3hld
 * @date 2020/1/14 17:14
 * @Version 1.0
 */
public class PasswordUtil {

    /**
     * 匹配密码
     * @param salt 盐
     * @param cleartext 明文
     * @param ciphertext 密文
     * @return
     */
    public static boolean matches(String salt, String cleartext, String ciphertext) {
        return new PasswordEncoder(salt).matches(ciphertext, cleartext);
    }
}
