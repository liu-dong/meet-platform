package com.dong.chat.web.service;

import com.dong.chat.web.domain.GroupChat;
import com.dong.chat.web.model.dto.GroupChatDTO;
import com.dong.chat.web.model.vo.GroupChatVO;
import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.Pagination;

public interface GroupChatService {

    /**
    * 查询群聊列表
    *
    * @param dto
    * @param pagination
    * @return
    */
    PageVO<GroupChatVO> findGroupChatList(GroupChatDTO dto, Pagination pagination);

    /**
    * 保存群聊
    *
    * @param dto
    * @return
    */
    GroupChatVO saveGroupChat(GroupChatDTO dto);

    /**
     * 新增群聊
     *
     * @param dto
     * @return
     */
    GroupChat insertGroupChat(GroupChatDTO dto);

    /**
     * 修改群聊
     *
     * @param dto
     * @return
     */
    GroupChat updateGroupChat(GroupChatDTO dto);

    /**
     * 查询群聊详情
     *
     * @param id
     * @return
     */
    GroupChatVO getGroupChat(String id);

    /**
    * 删除群聊
    *
    * @param id
    * @return
    */
    void deleteGroupChat(String id);

}
