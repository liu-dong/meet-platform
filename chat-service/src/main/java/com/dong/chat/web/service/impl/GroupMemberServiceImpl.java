package com.dong.chat.web.service.impl;

import com.dong.chat.web.domain.GroupMember;
import com.dong.chat.web.mapper.GroupMemberMapper;
import com.dong.chat.web.model.dto.GroupMemberDTO;
import com.dong.chat.web.model.vo.GroupMemberVO;
import com.dong.chat.web.service.GroupMemberService;
import com.dong.commoncore.constant.CommonConstant;
import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.Pagination;
import com.dong.commoncore.util.CommonUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class GroupMemberServiceImpl implements GroupMemberService {

    @Resource
    GroupMemberMapper groupMemberMapper;

    /**
     * 查询群聊列表
     *
     * @param dto
     * @param pagination
     * @return
     */
    @Override
    public PageVO<GroupMemberVO> findGroupMemberList(GroupMemberDTO dto, Pagination pagination) {
        List<GroupMemberVO> groupMemberList = groupMemberMapper.findGroupMemberList(dto, pagination.getPage(), pagination.getLimit());
        Integer total = groupMemberMapper.getTotal(dto);
        return new PageVO<>(pagination.getPage(), total, groupMemberList);
    }

    /**
     * 保存群聊
     *
     * @param dtoList
     * @return
     */
    @Override
    public List<GroupMember> batchSaveGroupMember(List<GroupMemberDTO> dtoList) {
        List<GroupMember> groupMembers = new ArrayList<>();
        for (GroupMemberDTO dto : dtoList) {
            GroupMember groupMember;
            if (StringUtils.isNotBlank(dto.getId())) {
                groupMember = this.updateGroupMember(dto);
            } else {
                groupMember = this.insertGroupMember(dto);
            }
            groupMembers.add(groupMember);
        }
        return groupMembers;
    }

    @Override
    public GroupMember insertGroupMember(GroupMemberDTO dto) {
        GroupMember entity = new GroupMember();
        BeanUtils.copyProperties(dto, entity);
        entity.setId(CommonUtils.getUUID());
        entity.setCreateTime(new Date());
        entity.setUpdateTime(new Date());
        entity.setIsDelete(CommonConstant.NO);
        groupMemberMapper.insert(entity);
        return entity;
    }

    @Override
    public GroupMember updateGroupMember(GroupMemberDTO dto) {
        GroupMember entity = new GroupMember();
        BeanUtils.copyProperties(dto, entity);
        entity.setUpdateTime(new Date());
        groupMemberMapper.update(entity);
        return entity;
    }

    /**
     * 查询群聊详情
     *
     * @param id
     * @return
     */
    @Override
    public GroupMember getGroupMember(String id) {
        return groupMemberMapper.getById(id);
    }

    @Override
    public List<GroupMember> getGroupMemberByGroupId(String groupId) {
        return groupMemberMapper.getByGroupId(groupId);
    }

    /**
     * 删除群聊
     *
     * @param id
     * @return
     */
    @Override
    public void deleteGroupMember(String id) {
        groupMemberMapper.deleteById(id);
    }

}
