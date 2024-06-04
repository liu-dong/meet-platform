package com.dong.auth.web.controller;

import com.dong.auth.web.service.UserDetailFactory;
import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.model.UserDetail;
import com.dong.user.service.AccountService;
import com.dong.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 用户信息
 *
 * @author LD 2023/10/27
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserDetailFactory userDetailFactory;
    @Autowired
    AccountService accountService;

    /**
     * 获取用户信息
     *
     * @param request
     * @return
     */
    @GetMapping("/getUserDetail")
    public ResponseResult<UserDetail> getUserDetail(HttpServletRequest request) {
        UserDetail user = userDetailFactory.createUserDetailService().getUserDetail(request);
        return ResponseResult.success(user, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 注销用户
     *
     * @param username 用户名
     * @return 返回结果
     */
    @PostMapping("/cancel")
    public ResponseResult<?> cancel(String username) {
        accountService.cancel(username);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
        return ResponseResult.success("注销成功!注销时间：" + sdf.format(new Date()));

    }

}
