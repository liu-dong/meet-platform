package com.dong.chat.web.service.impl;

import com.dong.chat.web.dao.GroupChatJpaDao;
import com.dong.chat.web.model.dto.GroupChatDTO;
import com.dong.chat.web.model.vo.GroupChatVO;
import com.dong.chat.web.service.GroupChatService;
import com.dong.commoncore.model.Pager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class GroupChatServiceImpl implements GroupChatService {

    @Resource
    GroupChatJpaDao groupChatJpaDao;

    /**
    * 查询群聊列表
    *
    * @param dto
    * @param pager
    * @return
    */
    @Override
    public Pager<GroupChatVO> findGroupChatList(GroupChatDTO dto, Pager<GroupChatVO> pager) {
        return null;
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

    /**
    * 查询群聊详情
    *
    * @param id
    * @return
    */
    @Override
    public GroupChatVO getGroupChat(String id) {
        return null;
    }

    /**
    * 删除群聊
    *
    * @param id
    * @return
    */
    @Override
    public void deleteGroupChat(String id) {}

}