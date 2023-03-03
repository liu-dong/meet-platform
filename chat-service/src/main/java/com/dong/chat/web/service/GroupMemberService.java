package com.dong.chat.web.service;

import com.dong.chat.web.model.dto.GroupMemberDTO;
import com.dong.chat.web.model.vo.GroupMemberVO;
import com.dong.commoncore.model.Pager;

public interface GroupMemberService {

    /**
    * 查询群成员列表
    *
    * @param dto
    * @param pager
    * @return
    */
    Pager<GroupMemberVO> findGroupMemberList(GroupMemberDTO dto, Pager<GroupMemberVO> pager);

    /**
    * 保存群成员
    *
    * @param dto
    * @return
    */
    GroupMemberVO saveGroupMember(GroupMemberDTO dto);

    /**
    * 查询群成员详情
    *
    * @param id
    * @return
    */
    GroupMemberVO getGroupMember(String id);

    /**
    * 删除群成员
    *
    * @param id
    * @return
    */
    void deleteGroupMember(String id);

}