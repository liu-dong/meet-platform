package com.dong.adminserver.web.service;

import com.dong.adminserver.web.model.AccountInfoBean;
import com.dong.commoncore.model.ResponseResult;

/**
 * @author LD
 * @date 2020/10/12 12:53
 */
public interface AccountInfoService {

    /**
     * 注册用户
     *
     * @param bean
     * @return
     */
    ResponseResult register(AccountInfoBean bean);

    /**
     * 登录
     *
     * @param username
     * @param password
     * @return
     */
    ResponseResult login(String username, String password);

    /**
     * 退出登录
     *
     * @param username
     * @return
     */
    ResponseResult logout(String username);

    /**
     * 注销用户
     *
     * @param username
     * @return
     */
    ResponseResult cancel(String username);

    /**
     * 查询用户信息列表
     *
     * @param bean
     * @param limit
     * @param page
     * @return
     */
    ResponseResult findAccountInfoList(AccountInfoBean bean, Integer limit, Integer page);

    /**
     * 查询用户信息
     *
     * @param id
     * @return
     */
    ResponseResult getAccountInfo(String id);

    /**
     * 删除用户
     *
     * @param id
     * @return
     */
    ResponseResult deleteAccountInfo(String id);

    /**
     * 根据账号id查询角色信息
     *
     * @param bean
     * @return
     */
    ResponseResult findAccountRoleInfoList(AccountInfoBean bean);

    /**
     * 分配角色
     *
     * @param bean
     * @return
     */
    ResponseResult assignRoles(AccountInfoBean bean);
}
