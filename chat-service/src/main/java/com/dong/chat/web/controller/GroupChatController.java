package com.dong.chat.web.controller;

import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
*  群聊
*
*  @author Lenovo
*/
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
    @PostMapping("/findGroupChatList")
    public ResponseResult findGroupChatList(GroupChatDTO dto, Pager pager) {
    Pager<GroupChatDTO> dtoList = groupChatService.findGroupChatList(dto, pager);
        return ResponseResult.success(dtoList, "查询成功!");
    }

    /**
    * 保存群聊
    *
    * @param dto
    * @return
    */
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
    @PostMapping("/deleteGroupChat")
    public ResponseResult deleteGroupChat(String id) {
        groupChatService.deleteGroupChat(id);
        return ResponseResult.success("删除成功!");
    }
}
