package com.dong.chat.web.mapper;

import com.dong.chat.web.domain.GroupMember;
import com.dong.chat.web.model.dto.GroupMemberDTO;
import com.dong.chat.web.model.vo.GroupMemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* @author liudong
* @description 针对表【group_member(群成员表)】的数据库操作Mapper
* @createDate 2023-03-06 11:36:20
* @Entity com.dong.chat.web.domain.GroupMember
*/
@Mapper
public interface GroupMemberMapper {

    /**
     * 查询群成员列表
     *
     * @param dto
     * @return
     */
    List<GroupMemberVO> findGroupMemberList(@Param("dto") GroupMemberDTO dto, @Param("offset") Integer offset, @Param("limit") Integer limit);

    /**
     * 统计总数
     *
     * @param dto
     * @return
     */
    Integer getTotal(@Param("dto") GroupMemberDTO dto);

    int deleteById(String id);

    int insert(GroupMember record);

    GroupMember getById(String id);

    int update(GroupMember record);

    List<GroupMember> getByGroupId(String groupId);
}
