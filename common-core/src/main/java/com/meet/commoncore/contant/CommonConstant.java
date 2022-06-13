package com.meet.commoncore.contant;

/**
 * @author LD 2021/5/28
 */
public class CommonConstant {

    //Redis数据类型
    public final static String REDIS_STRING = "string";//字符串类型
    public final static String REDIS_HASH = "hash";//散列hash
    public final static String REDIS_LIST = "list";//列表list
    public final static String REDIS_SET = "set";//集合set
    public final static String REDIS_ZSET = "zset";//有序集合zset

    public final static String EMAIL_CODE_PATH = "code:email:";//redis存储邮箱验证码路径
    public final static String PHONE_CODE_PATH = "code:phone:";//redis存储邮箱验证码路径

    public final static Integer SECURITY_CODE_EXPIRE = 9000;//验证码到期时间 15分钟

    public final static String SUCCESS = "success";//成功
    public final static String FAILURE = "failure";//失败
}
