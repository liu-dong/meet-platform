package com.dong.commoncore.contant;

/**
 * @author LD 2021/5/28
 */
public class CommonConstant {

    private CommonConstant() {
    }

    //Redis数据类型
    public static final String REDIS_STRING = "string";//字符串类型
    public static final String REDIS_HASH = "hash";//散列hash
    public static final String REDIS_LIST = "list";//列表list
    public static final String REDIS_SET = "set";//集合set
    public static final String REDIS_ZSET = "zset";//有序集合zset

    public static final String EMAIL_CODE_PATH = "code:email:";//redis存储邮箱验证码路径
    public static final String PHONE_CODE_PATH = "code:phone:";//redis存储邮箱验证码路径

    public static final Integer SECURITY_CODE_EXPIRE = 9000;//验证码到期时间 15分钟

    public static final String SUCCESS = "success";//成功
    public static final String FAILURE = "failure";//失败
}
