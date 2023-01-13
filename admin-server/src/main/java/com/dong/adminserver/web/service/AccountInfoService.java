package com.dong.adminserver.web.service;

import com.dong.adminserver.web.entity.Account;
import com.dong.adminserver.web.model.dto.AccountDTO;
import com.dong.adminserver.web.model.vo.AccountVO;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;

/**
 * @author LD
 * @date 2020/10/12 12:53
 */
public interface AccountInfoService {

    /**
     * 注册用户
     *
     * @param dto
     * @return
     */
    ResponseResult register(AccountDTO dto);

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
     * @param dto
     * @param pager
     * @return
     */
    Pager<AccountVO> findAccountInfoList(AccountDTO dto, Pager<AccountVO> pager);

    /**
     * 查询用户信息
     *
     * @param id
     * @return
     */
    Account getAccountInfo(String id);

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
     * @param dto
     * @return
     */
    ResponseResult findAccountRoleInfoList(AccountDTO dto);

    /**
     * 分配角色
     *
     * @param dto
     * @return
     */
    ResponseResult assignRoles(AccountDTO dto);
}
