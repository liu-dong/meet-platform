package com.dong.adminserver.web.controller;

import com.dong.adminserver.web.model.AccountInfoBean;
import com.dong.adminserver.web.service.AccountInfoService;
import com.dong.commoncore.model.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 用户登录模块
 *
 * @author LD
 * @date 2020/3/22 20:59
 */
@Api(tags = "账号管理模块")
@RequestMapping("/accountInfo")
@RestController
public class AccountInfoController {

    @Autowired
    private AccountInfoService accountInfoService;

    @GetMapping("/hello")
    public String hello(String s) {
        return s;
    }

    /**
     * 注册用户
     *
     * @param bean
     * @return
     */
    @ApiOperation("注册用户")
    @PostMapping("/register")
    public ResponseResult register(@RequestBody AccountInfoBean bean) {
        return accountInfoService.register(bean);
    }

    /**
     * 用户登录
     *
     * @param username 用户名
     * @param password 密码
     * @return 返回结果
     */
    @ApiOperation("用户登录")
    @PostMapping(value = "/login")
    public ResponseResult login(String username, String password) {
        return accountInfoService.login(username, password);
    }

    /**
     * 退出登录
     *
     * @param username 用户名
     * @return 返回结果
     */
    @ApiOperation("退出登录")
    @PostMapping("/logout")
    public ResponseResult logout(String username) {
        return accountInfoService.logout(username);
    }

    /**
     * 注销用户
     *
     * @param username 用户名
     * @return 返回结果
     */
    @ApiOperation("注销用户")
    @PostMapping("/cancel")
    public ResponseResult cancel(String username) {
        return accountInfoService.cancel(username);
    }

    /**
     * 查询用户信息列表
     *
     * @param bean
     * @param limit
     * @param page
     * @return
     */
    @ApiOperation("查询用户信息列表")
    @PostMapping("/findAccountInfoList")
    public ResponseResult findAccountInfoList(@RequestBody AccountInfoBean bean, Integer limit, Integer page) {
        return accountInfoService.findAccountInfoList(bean, limit, page);
    }

    /**
     * 查询用户信息
     *
     * @param id
     * @return
     */
    @ApiOperation("查询用户信息")
    @GetMapping("/getAccountInfo")
    public ResponseResult getAccountInfo(String id) {
        return accountInfoService.getAccountInfo(id);
    }

    /**
     * 删除用户信息
     *
     * @param id
     * @return
     */
    @ApiOperation("删除用户信息")
    @PostMapping("/deleteAccountInfo")
    public ResponseResult deleteAccountInfo(String id) {
        return accountInfoService.deleteAccountInfo(id);
    }

    /**
     * 根据账号id查询角色信息
     *
     * @param bean
     * @return
     */

    @ApiOperation("查询角色账号信息")
    @PostMapping("/findAccountRoleInfoList")
    public ResponseResult findAccountRoleInfoList(@RequestBody AccountInfoBean bean) {
        return accountInfoService.findAccountRoleInfoList(bean);
    }

    /**
     * 分派角色
     *
     * @param bean
     * @return
     */
    @ApiOperation("分派角色")
    @PostMapping("/assignRoles")
    public ResponseResult assignRoles(@RequestBody AccountInfoBean bean) {
        return accountInfoService.assignRoles(bean);
    }

}
