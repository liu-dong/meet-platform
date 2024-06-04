package com.dong.adminserver.web.controller;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.Pagination;
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
     * 查询账号信息列表
     *
     * @param dto
     * @param pagination
     * @return
     */
    @ApiOperation("查询账号信息列表")
    @GetMapping("/findAccountList")
    public ResponseResult<PageVO<AccountVO>> findAccountList(AccountDTO dto, Pagination pagination) {
        PageVO<AccountVO> accountList = accountService.findAccountList(dto, pagination);
        return ResponseResult.success(accountList, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 查询账号信息
     *
     * @param id
     * @return
     */
    @ApiOperation("查询账号信息")
    @GetMapping("/getAccount")
    public ResponseResult<AccountVO> getAccount(String id) {
        AccountVO account = accountService.getAccount(id);
        return ResponseResult.success(account, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 删除账号信息
     *
     * @param id
     * @return
     */
    @ApiOperation("删除账号信息")
    @PostMapping("/deleteAccount")
    public ResponseResult<?> deleteAccount(String id) {
        accountService.deleteAccount(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }
}
