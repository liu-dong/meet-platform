package com.dong.chat.web.service;

import com.dong.commoncore.model.Pager;

public interface GroupChatService {

    /**
    * 查询群聊列表
    *
    * @param dto
    * @param pager
    * @return
    */
    Pager<GroupChatVO> findGroupChatList(GroupChatDTO dto, Pager pager);

    /**
    * 保存群聊
    *
    * @param dto
    * @return
    */
    GroupChatDTO saveGroupChat(GroupChatDTO dto);

    /**
    * 查询群聊详情
    *
    * @param id
    * @return
    */
    GroupChatDTO getGroupChat(String id);

    /**
    * 删除群聊
    *
    * @param id
    * @return
    */
    void deleteGroupChat(String id);

}