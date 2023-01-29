package com.dong.adminserver.web.controller;

import com.dong.adminserver.web.entity.Account;
import com.dong.adminserver.web.entity.AccountRole;
import com.dong.adminserver.web.model.dto.AccountDTO;
import com.dong.adminserver.web.model.vo.AccountVO;
import com.dong.adminserver.web.service.AccountInfoService;
import com.dong.commoncore.contant.ResponseMessageConstant;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

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

    /**
     * 注册用户
     *
     * @param dto
     * @return
     */
    @ApiOperation("注册用户")
    @PostMapping("/register")
    public ResponseResult register(@RequestBody AccountDTO dto) {
        Account account = accountInfoService.register(dto);
        return ResponseResult.success(account, ResponseMessageConstant.REGISTER_SUCCESS);
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
        AccountVO accountVO = accountInfoService.login(username, password);
        return ResponseResult.success(accountVO, ResponseMessageConstant.LOGIN_SUCCESS);
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
        String cancel = accountInfoService.cancel(username);
        return ResponseResult.success(cancel);
    }

    /**
     * 查询用户信息列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @ApiOperation("查询用户信息列表")
    @PostMapping("/findAccountInfoList")
    public ResponseResult findAccountInfoList(@RequestBody AccountDTO dto, Pager<AccountVO> pager) {
        Pager<AccountVO> accountInfoList = accountInfoService.findAccountInfoList(dto, pager);
        return ResponseResult.success(accountInfoList, ResponseMessageConstant.QUERY_SUCCESS);
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
        Account accountInfo = accountInfoService.getAccountInfo(id);
        return ResponseResult.success(accountInfo, ResponseMessageConstant.QUERY_SUCCESS);
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
        accountInfoService.deleteAccountInfo(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }

    /**
     * 根据账号id查询角色信息
     *
     * @param dto
     * @return
     */

    @ApiOperation("查询角色账号信息")
    @PostMapping("/findAccountRoleInfoList")
    public ResponseResult findAccountRoleInfoList(@RequestBody AccountDTO dto) {
        List<Map<String, Object>> dataList = accountInfoService.findAccountRoleInfoList(dto);
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
        List<AccountRole> accountRoles = accountInfoService.assignRoles(dto);
        return ResponseResult.success(accountRoles, ResponseMessageConstant.OPERATE_SUCCESS);
    }

}
