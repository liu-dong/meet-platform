package com.dong.adminserver.web.controller;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import com.dong.user.entity.Account;
import com.dong.user.entity.UserRole;
import com.dong.user.model.dto.AccountDTO;
import com.dong.user.model.vo.AccountVO;
import com.dong.user.service.AccountService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 账号管理
 *
 * @author LD
 * @date 2020/3/22 20:59
 */
@Api(tags = "账号管理模块")
@RequestMapping("/account")
@RestController
public class AccountController {

    @Autowired
    private AccountService accountService;

    /**
     * 查询用户信息列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @ApiOperation("查询用户信息列表")
    @GetMapping("/findAccountList")
    public ResponseResult findAccountList(AccountDTO dto, Pager<AccountVO> pager) {
        Pager<AccountVO> accountList = accountService.findAccountList(dto, pager);
        return ResponseResult.success(accountList, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 查询用户信息
     *
     * @param id
     * @return
     */
    @ApiOperation("查询用户信息")
    @GetMapping("/getAccount")
    public ResponseResult getAccount(String id) {
        Account account = accountService.getAccount(id);
        return ResponseResult.success(account, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 删除用户信息
     *
     * @param id
     * @return
     */
    @ApiOperation("删除用户信息")
    @PostMapping("/deleteAccount")
    public ResponseResult deleteAccount(String id) {
        accountService.deleteAccount(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }

    /**
     * 根据账号id查询角色信息
     *
     * @param accountId
     * @return
     */

    @ApiOperation("查询角色账号信息")
    @GetMapping("/findAccountRoleInfoList")
    public ResponseResult findAccountRoleInfoList(String accountId) {
        List<Map<String, Object>> dataList = accountService.findAccountRoleInfoList(accountId);
        return ResponseResult.success(dataList, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 分派角色
     *
     * @param dto
     * @return
     */
    @ApiOperation("分派角色")
    @PostMapping("/assignRoles")
    public ResponseResult assignRoles(@RequestBody AccountDTO dto) {
        List<UserRole> userRoles = accountService.assignRoles(dto);
        return ResponseResult.success(userRoles, ResponseMessageConstant.OPERATE_SUCCESS);
    }

}
