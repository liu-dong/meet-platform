package com.dong.securitycore.service;

import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import com.dong.securitycore.entity.Account;
import com.dong.securitycore.entity.AccountRole;
import com.dong.securitycore.model.dto.AccountDTO;
import com.dong.securitycore.model.vo.AccountVO;

import java.util.List;
import java.util.Map;

/**
 * @author LD
 * @date 2020/10/12 12:53
 */
public interface AccountService {

    /**
     * 注册用户
     *
     * @param dto
     * @return
     */
    Account register(AccountDTO dto);

    /**
     * 登录
     *
     * @param username
     * @param password
     * @return
     */
    AccountVO login(String username, String password);

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
    String cancel(String username);

    /**
     * 查询用户信息列表
     *
     * @param dto
     * @param pager
     * @return
     */
    Pager<AccountVO> findAccountList(AccountDTO dto, Pager<AccountVO> pager);

    /**
     * 查询用户信息
     *
     * @param id
     * @return
     */
    Account getAccount(String id);

    /**
     * 删除用户
     *
     * @param id
     * @return
     */
    void deleteAccount(String id);

    /**
     * 根据账号id查询角色信息
     *
     * @param accountId
     * @return
     */
    List<Map<String, Object>> findAccountRoleInfoList(String accountId);

    /**
     * 根据账号id查询权限信息
     *
     * @param accountId
     * @return
     */
    List<Map<String, Object>> findAccountPermissionList(String accountId);

    /**
     * 分配角色
     *
     * @param dto
     * @return
     */
    List<AccountRole> assignRoles(AccountDTO dto);

    Account getAccountByUsername(String username);

    String updateLastLoginTime(Account account);
}
