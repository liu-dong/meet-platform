package com.dong.event.web.service;

import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.Pagination;
import com.dong.event.web.entity.Event;
import com.dong.event.web.model.dto.EventDTO;
import com.dong.event.web.model.vo.EventVO;

public interface EventService {

    /**
    * 查询事件列表
    *
    * @param dto
    * @param pagination
    * @return
    */
    PageVO<EventVO> findEventList(EventDTO dto, Pagination pagination);

    /**
     * 保存事件
     *
     * @param dto
     * @return
     */
    Event registerEvent(EventDTO dto);

    /**
    * 查询事件详情
    *
    * @param id
    * @return
    */
    EventVO getEvent(String id);

    /**
    * 删除事件
    *
    * @param id
    * @return
    */
    void deleteEvent(String id);

}
