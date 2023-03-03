package com.dong.chat.web.controller;

import com.dong.chat.web.model.dto.GroupMemberDTO;
import com.dong.chat.web.model.vo.GroupMemberVO;
import com.dong.chat.web.service.GroupMemberService;
import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
*  群成员
*
*  @author Lenovo
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
    public ResponseResult findGroupMemberList(GroupMemberDTO dto, Pager<GroupMemberVO> pager) {
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
    public ResponseResult saveGroupMember(GroupMemberDTO dto) {
        GroupMemberVO result = groupMemberService.saveGroupMember(dto);
        return ResponseResult.success(result, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
    * 查询群成员
    *
    * @param id
    * @return
    */
    @GetMapping("/getGroupMember")
    public ResponseResult getGroupMember(String id) {
        GroupMemberVO result = groupMemberService.getGroupMember(id);
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
