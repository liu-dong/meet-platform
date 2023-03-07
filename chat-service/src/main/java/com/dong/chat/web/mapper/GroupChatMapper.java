package com.dong.chat.web.mapper;

import com.dong.chat.web.domain.GroupChat;
import com.dong.chat.web.model.dto.GroupChatDTO;
import com.dong.chat.web.model.vo.GroupChatVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface GroupChatMapper {

    /**
     * 查询群聊列表
     *
     * @param dto
     * @return
     */
    List<GroupChatVO> findGroupChatList(@Param("dto") GroupChatDTO dto, @Param("page") Integer page, @Param("size") Integer size);

    /**
     * 统计总数
     *
     * @param dto
     * @return
     */
    Integer getTotal(GroupChatDTO dto);

    int deleteById(String id);

    int insert(GroupChat record);

    GroupChat getById(String id);

    int update(GroupChat record);


}
