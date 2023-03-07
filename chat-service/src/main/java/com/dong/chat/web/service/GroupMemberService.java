package com.dong.chat.web.service;

import com.dong.chat.web.domain.GroupMember;
import com.dong.chat.web.model.dto.GroupMemberDTO;
import com.dong.chat.web.model.vo.GroupMemberVO;
import com.dong.commoncore.model.Pager;

import java.util.List;

public interface GroupMemberService {

    /**
    * 查询群聊列表
    *
    * @param dto
    * @param pager
    * @return
    */
    Pager<GroupMemberVO> findGroupMemberList(GroupMemberDTO dto, Pager<GroupMemberVO> pager);

    /**
     * 保存群聊
     *
     * @param dtoList
     * @return
     */
    List<GroupMember> batchSaveGroupMember(List<GroupMemberDTO> dtoList);

    /**
     * 新增群聊
     *
     * @param dto
     * @return
     */
    GroupMember insertGroupMember(GroupMemberDTO dto);

    /**
     * 修改群聊
     *
     * @param dto
     * @return
     */
    GroupMember updateGroupMember(GroupMemberDTO dto);

    /**
     * 查询群聊详情
     *
     * @param id
     * @return
     */
    GroupMember getGroupMember(String id);

    /**
     * 根据群聊id查询群成员
     *
     * @param groupId
     * @return
     */
    List<GroupMember> getGroupMemberByGroupId(String groupId);

    /**
    * 删除群聊
    *
    * @param id
    * @return
    */
    void deleteGroupMember(String id);

}