package com.dong.event.web.service.impl;

import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.Pagination;
import com.dong.event.web.dao.EventFlowRepository;
import com.dong.event.web.model.dto.EventFlowDTO;
import com.dong.event.web.model.vo.EventFlowVO;
import com.dong.event.web.service.EventFlowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EventFlowServiceImpl implements EventFlowService {

    @Autowired
    EventFlowRepository eventFlowRepository;

    /**
     * 查询事件流程列表
     *
     * @param dto
     * @param pagination
     * @return
     */
    @Override
    public PageVO<EventFlowVO> findEventFlowList(EventFlowDTO dto, Pagination pagination) {
        return null;
    }

    /**
     * 保存事件流程
     *
     * @param dto
     * @return
     */
    @Override
    public EventFlowVO saveEventFlow(EventFlowDTO dto) {

        return null;
    }

    /**
     * 查询事件流程详情
     *
     * @param id
     * @return
     */
    @Override
    public EventFlowVO getEventFlow(String id) {
        return null;
    }

    /**
     * 删除事件流程
     *
     * @param id
     * @return
     */
    @Override
    public void deleteEventFlow(String id) {

    }

}
