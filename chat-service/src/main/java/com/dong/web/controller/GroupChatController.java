package com.dong.web.controller;

import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 群聊
 *
 * @author Lenovo
 */
@Api(tags = "群聊管理模块")
@RestController
@RequestMapping("/groupChat")
public class GroupChatController {

    @Autowired
    private GroupChatService groupChatService;

    /**
     * 查询群聊列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @ApiOperation("查询群聊列表")
    @PostMapping("/findGroupChatList")
    public ResponseResult findGroupChatList(GroupChatDTO dto, Pager pager) {
        Pager
                <GroupChatDTO> dtoList = groupChatService.findGroupChatList(dto, pager);
        return ResponseResult.success(dtoList, "查询成功!");
    }

    /**
     * 保存群聊
     *
     * @param dto
     * @return
     */
    @ApiOperation("保存群聊")
    @PostMapping("/saveGroupChat")
    public ResponseResult saveGroupChat(GroupChatDTO dto) {
        GroupChatDTO result = groupChatService.saveGroupChat(dto);
        return ResponseResult.success(dto, "保存成功!");
    }

    /**
     * 查询群聊
     *
     * @param id
     * @return
     */
    @ApiOperation("查询群聊")
    @GetMapping("/getGroupChat")
    public ResponseResult getGroupChat(String id) {
        GroupChatDTO result = groupChatService.getGroupChat(id);
        return ResponseResult.success(dto, "查询成功!");
    }

    /**
     * 删除群聊
     *
     * @param id
     * @return
     */
    @ApiOperation("删除群聊")
    @PostMapping("/deleteGroupChat")
    public ResponseResult deleteGroupChat(String id) {
        groupChatService.deleteGroupChat(id);
        return ResponseResult.success("删除成功!");
    }
}
