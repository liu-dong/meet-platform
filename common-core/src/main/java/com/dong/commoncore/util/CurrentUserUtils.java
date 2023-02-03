package com.dong.commoncore.util;

import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.model.UserDetail;

/**
 * @author liudong 2022/6/29
 */
public final class CurrentUserUtils {

    private CurrentUserUtils() {
    }

    private static final ThreadLocal<UserDetail> CURRENT_USER_DETAIL = new ThreadLocal<>();

    public static void set(UserDetail userDetail) {
        CURRENT_USER_DETAIL.set(userDetail);
    }

    public static void remove() {
        CURRENT_USER_DETAIL.remove();
    }

    public static UserDetail currentUser() {
        return CURRENT_USER_DETAIL.get();
    }

    public static String getUserId() {
        if (CURRENT_USER_DETAIL.get() != null) {
            return CURRENT_USER_DETAIL.get().getUserId();
        } else {
            throw new GlobalException(500, "无用户登录信息");
        }
    }

    public static String getUsername() {
        if (CURRENT_USER_DETAIL.get() != null) {
            return CURRENT_USER_DETAIL.get().getUsername();
        } else {
            throw new GlobalException(500, "无用户登录信息");
        }
    }
}
