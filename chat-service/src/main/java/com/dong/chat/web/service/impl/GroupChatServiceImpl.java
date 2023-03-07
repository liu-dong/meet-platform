package com.dong.chat.web.service.impl;

import com.dong.chat.web.domain.GroupChat;
import com.dong.chat.web.domain.GroupMember;
import com.dong.chat.web.mapper.GroupChatMapper;
import com.dong.chat.web.model.dto.GroupChatDTO;
import com.dong.chat.web.model.dto.GroupMemberDTO;
import com.dong.chat.web.model.vo.GroupChatVO;
import com.dong.chat.web.service.GroupChatService;
import com.dong.chat.web.service.GroupMemberService;
import com.dong.commoncore.constant.CommonConstant;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.util.CommonUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class GroupChatServiceImpl implements GroupChatService {

    @Resource
    GroupChatMapper groupChatMapper;
    @Resource
    GroupMemberService groupMemberService;

    /**
     * 查询群聊列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @Override
    public Pager<GroupChatVO> findGroupChatList(GroupChatDTO dto, Pager<GroupChatVO> pager) {
        List<GroupChatVO> groupChatList = groupChatMapper.findGroupChatList(dto, pager.getPage(), pager.getLimit());
//        Integer total = groupChatMapper.getTotal(dto);
        pager.setDataList(groupChatList);
//        pager.setTotal(total);
        return pager;
    }

    /**
     * 保存群聊
     *
     * @param dto
     * @return
     */
    @Override
    public GroupChatVO saveGroupChat(GroupChatDTO dto) {

        return null;
    }

    @Transactional
    @Override
    public GroupChat insertGroupChat(GroupChatDTO dto) {
        GroupChat entity = new GroupChat();
        BeanUtils.copyProperties(dto, entity);
        entity.setId(CommonUtils.getUUID());
        entity.setCreateTime(new Date());
        entity.setUpdateTime(new Date());
        entity.setIsDelete(CommonConstant.NO);
        groupChatMapper.insert(entity);
        //保存群成员
        saveGroupMember(dto, entity);
        return entity;
    }

    private void saveGroupMember(GroupChatDTO dto, GroupChat entity) {
        //插入群id
        for (GroupMemberDTO groupMemberDTO : dto.getGroupMemberList()) {
            groupMemberDTO.setGroupId(entity.getId());
        }
        //保存群成员
        groupMemberService.batchSaveGroupMember(dto.getGroupMemberList());
    }

    @Transactional
    @Override
    public GroupChat updateGroupChat(GroupChatDTO dto) {
        GroupChat entity = new GroupChat();
        BeanUtils.copyProperties(dto, entity);
        entity.setUpdateTime(new Date());
        groupChatMapper.update(entity);
        //保存群成员
        saveGroupMember(dto, entity);
        return entity;
    }

    /**
     * 查询群聊详情
     *
     * @param id
     * @return
     */
    @Override
    public GroupChatVO getGroupChat(String id) {
        //查询群详情
        GroupChat groupChat = groupChatMapper.getById(id);
        //查询群成员
        List<GroupMember> groupMemberList = groupMemberService.getGroupMemberByGroupId(groupChat.getId());
        return convertGroupChatVO(groupChat, groupMemberList);
    }

    private GroupChatVO convertGroupChatVO(GroupChat groupChat, List<GroupMember> groupMemberList) {
        GroupChatVO vo = new GroupChatVO();
        BeanUtils.copyProperties(groupChat, vo);
        vo.setGroupMemberList(groupMemberList);
        return vo;
    }

    /**
     * 删除群聊
     *
     * @param id
     * @return
     */
    @Override
    public void deleteGroupChat(String id) {
        groupChatMapper.deleteById(id);
    }

}