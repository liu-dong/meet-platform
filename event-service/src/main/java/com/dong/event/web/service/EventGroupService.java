package com.dong.event.web.service;

import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.Pagination;
import com.dong.event.web.entity.EventGroup;
import com.dong.event.web.model.dto.EventGroupDTO;
import com.dong.event.web.model.vo.EventGroupVO;

public interface EventGroupService {

    /**
    * 查询事件群聊关联列表
    *
    * @param dto
    * @param pagination
    * @return
    */
    PageVO<EventGroupVO> findEventGroupList(EventGroupDTO dto, Pagination pagination);

    /**
     * 保存事件群聊关联
     *
     * @param dto
     * @return
     */
    EventGroup saveEventGroup(EventGroupDTO dto);

    /**
    * 查询事件群聊关联详情
    *
    * @param id
    * @return
    */
    EventGroupVO getEventGroup(String id);

    /**
    * 删除事件群聊关联
    *
    * @param id
    * @return
    */
    void deleteEventGroup(String id);

}
