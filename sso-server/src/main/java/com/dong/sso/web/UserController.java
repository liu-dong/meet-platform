package com.dong.sso.web;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.model.UserDetail;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 用户信息
 *
 * @author LD 2023/10/27
 */
@RestController
@RequestMapping("/user")
public class UserController {


    /**
     * 获取用户信息
     *
     * @return
     */
    @GetMapping("/toLoginPage")
    public String toLoginPage() {
       return "myLogin";
    }

    /**
     * 获取用户信息
     *
     * @return
     */
    @GetMapping("/getUserDetail")
    public ResponseResult getUserDetail() {
        UserDetail user = new UserDetail();
        user.setRealName("LD");
        return ResponseResult.success(user, ResponseMessageConstant.QUERY_SUCCESS);
    }


}
