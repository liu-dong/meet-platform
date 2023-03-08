package com.dong.chat.web.controller;

import com.dong.chat.web.domain.GroupMember;
import com.dong.chat.web.model.dto.GroupMemberDTO;
import com.dong.chat.web.model.vo.GroupMemberVO;
import com.dong.chat.web.service.GroupMemberService;
import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;

/**
 * 群成员
 *
 * @author liudong
 */
@RestController
@RequestMapping("/groupMember")
public class GroupMemberController {

    @Autowired
    GroupMemberService groupMemberService;

    /**
     * 查询群成员列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @PostMapping("/findGroupMemberList")
    public ResponseResult findGroupMemberList(@RequestBody GroupMemberDTO dto, Pager<GroupMemberVO> pager) {
        Pager<GroupMemberVO> result = groupMemberService.findGroupMemberList(dto, pager);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 保存群成员
     *
     * @param dto
     * @return
     */
    @PostMapping("/saveGroupMember")
    public ResponseResult saveGroupMember(@RequestBody GroupMemberDTO dto) {
        List<GroupMember> result = groupMemberService.batchSaveGroupMember(Collections.singletonList(dto));
        return ResponseResult.success(result.get(0), ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
     * 查询群成员
     *
     * @param id
     * @return
     */
    @GetMapping("/getGroupMember")
    public ResponseResult getGroupMember(String id) {
        GroupMember result = groupMemberService.getGroupMember(id);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 删除群成员
     *
     * @param id
     * @return
     */
    @PostMapping("/deleteGroupMember")
    public ResponseResult deleteGroupMember(String id) {
        groupMemberService.deleteGroupMember(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }
}
