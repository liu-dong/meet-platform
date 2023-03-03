package com.dong.chat.web.controller;

import com.dong.chat.web.model.dto.GroupChatDTO;
import com.dong.chat.web.model.vo.GroupChatVO;
import com.dong.chat.web.service.GroupChatService;
import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
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
@RestController
@RequestMapping("/groupChat")
public class GroupChatController {

    @Autowired
    GroupChatService groupChatService;

    /**
     * 查询群聊列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @PostMapping("/findGroupChatList")
    public ResponseResult findGroupChatList(GroupChatDTO dto, Pager<GroupChatVO> pager) {
        Pager<GroupChatVO> result = groupChatService.findGroupChatList(dto, pager);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 保存群聊
     *
     * @param dto
     * @return
     */
    @PostMapping("/saveGroupChat")
    public ResponseResult saveGroupChat(GroupChatDTO dto) {
        GroupChatVO result = groupChatService.saveGroupChat(dto);
        return ResponseResult.success(result, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
     * 查询群聊
     *
     * @param id
     * @return
     */
    @GetMapping("/getGroupChat")
    public ResponseResult getGroupChat(String id) {
        GroupChatVO result = groupChatService.getGroupChat(id);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
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
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }
}
