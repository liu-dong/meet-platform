package com.dong.chat.web.service.impl;

import com.dong.commoncore.model.Pager;
import org.springframework.stereotype.Service;

@Service
public class GroupChatServiceImpl implements GroupChatService {

    /**
    * 查询群聊列表
    *
    * @param dto
    * @param pager
    * @return
    */
    @Override
    public Pager<GroupChatDTO> findGroupChatList(GroupChatDTO dto, Pager pager) {
        return null;
    }

    /**
    * 保存群聊
    *
    * @param dto
    * @return
    */
    @Override
    public GroupChatDTO saveGroupChat(GroupChatDTO dto) {
        return null;
    }

    /**
    * 查询群聊详情
    *
    * @param id
    * @return
    */
    @Override
    public GroupChatDTO getGroupChat(String id) {
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