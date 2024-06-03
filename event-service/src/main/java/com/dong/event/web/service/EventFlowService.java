package com.dong.event.web.service;

import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.Pagination;
import com.dong.event.web.model.dto.EventFlowDTO;
import com.dong.event.web.model.vo.EventFlowVO;

public interface EventFlowService {

    /**
    * 查询事件流程列表
    *
    * @param dto
    * @param pagination
    * @return
    */
    PageVO<EventFlowVO> findEventFlowList(EventFlowDTO dto, Pagination pagination);

    /**
    * 保存事件流程
    *
    * @param dto
    * @return
    */
    EventFlowVO saveEventFlow(EventFlowDTO dto);

    /**
    * 查询事件流程详情
    *
    * @param id
    * @return
    */
    EventFlowVO getEventFlow(String id);

    /**
    * 删除事件流程
    *
    * @param id
    * @return
    */
    void deleteEventFlow(String id);

}
