package com.dong.chat.web.service.impl;

import com.dong.chat.web.dao.GroupMemberJpaDao;
import com.dong.chat.web.model.dto.GroupMemberDTO;
import com.dong.chat.web.model.vo.GroupMemberVO;
import com.dong.chat.web.service.GroupMemberService;
import com.dong.commoncore.model.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GroupMemberServiceImpl implements GroupMemberService {

    @Autowired
    GroupMemberJpaDao groupMemberJpaDao;

    /**
    * 查询群成员列表
    *
    * @param dto
    * @param pager
    * @return
    */
    @Override
    public Pager<GroupMemberVO> findGroupMemberList(GroupMemberDTO dto, Pager<GroupMemberVO> pager) {
        return null;
    }

    /**
    * 保存群成员
    *
    * @param dto
    * @return
    */
    @Override
    public GroupMemberVO saveGroupMember(GroupMemberDTO dto) {
        return null;
    }

    /**
    * 查询群成员详情
    *
    * @param id
    * @return
    */
    @Override
    public GroupMemberVO getGroupMember(String id) {
        return null;
    }

    /**
    * 删除群成员
    *
    * @param id
    * @return
    */
    @Override
    public void deleteGroupMember(String id) {}

}
