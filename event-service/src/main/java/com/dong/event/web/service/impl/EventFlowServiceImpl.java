package com.dong.event.web.service.impl;

import com.dong.commoncore.model.Pager;
import com.dong.event.web.dao.EventFlowJpaDao;
import com.dong.event.web.model.dto.EventFlowDTO;
import com.dong.event.web.model.vo.EventFlowVO;
import com.dong.event.web.service.EventFlowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EventFlowServiceImpl implements EventFlowService {

    @Autowired
    EventFlowJpaDao eventFlowJpaDao;

    /**
     * 查询事件流程列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @Override
    public Pager<EventFlowVO> findEventFlowList(EventFlowDTO dto, Pager<EventFlowVO> pager) {
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