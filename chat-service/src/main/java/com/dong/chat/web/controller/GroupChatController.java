package com.dong.chat.web.controller;

import com.dong.chat.web.domain.GroupChat;
import com.dong.chat.web.model.dto.GroupChatDTO;
import com.dong.chat.web.model.vo.GroupChatVO;
import com.dong.chat.web.service.GroupChatService;
import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.Pagination;
import com.dong.commoncore.model.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 群聊
 *
 * @author liudong
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
     * @param pagination
     * @return
     */
    @PostMapping("/findGroupChatList")
    public ResponseResult findGroupChatList(@RequestBody GroupChatDTO dto, Pagination pagination) {
        PageVO<GroupChatVO> result = groupChatService.findGroupChatList(dto, pagination);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 新增群聊
     *
     * @param dto
     * @return
     */
    @PostMapping("/insertGroupChat")
    public ResponseResult insertGroupChat(@RequestBody GroupChatDTO dto) {
        GroupChat result = groupChatService.insertGroupChat(dto);
        return ResponseResult.success(result, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
     * 修改群聊
     *
     * @param dto
     * @return
     */
    @PostMapping("/updateGroupChat")
    public ResponseResult updateGroupChat(@RequestBody GroupChatDTO dto) {
        GroupChat result = groupChatService.updateGroupChat(dto);
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
