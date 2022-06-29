package com.meet.commoncore.util;

import com.meet.commoncore.model.UserDetails;

/**
 * @author liudong 2022/6/29
 */
public class CurrentUserUtils {

    private CurrentUserUtils() {
    }

    private static final ThreadLocal<UserDetails> CURRENT_USER_DETAIL = new ThreadLocal<>();

    public static void set(UserDetails userDetails) {
        CURRENT_USER_DETAIL.set(userDetails);
    }


    public static UserDetails currentUser() {
        return CURRENT_USER_DETAIL.get();
    }

    public static void remove() {
        CURRENT_USER_DETAIL.remove();
    }
}
