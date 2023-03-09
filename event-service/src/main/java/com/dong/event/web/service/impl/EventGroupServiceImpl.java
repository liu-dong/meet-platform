package com.dong.event.web.service.impl;

import com.dong.commoncore.model.Pager;
import com.dong.event.web.dao.EventGroupJpaDao;
import com.dong.event.web.model.dto.EventGroupDTO;
import com.dong.event.web.model.vo.EventGroupVO;
import com.dong.event.web.service.EventGroupService;
import org.springframework.stereotype.Service;

@Service
public class EventGroupServiceImpl implements EventGroupService {

    @Autowired
    EventGroupJpaDao eventGroupJpaDao;

    /**
    * 查询事件群聊关联列表
    *
    * @param dto
    * @param pager
    * @return
    */
    @Override
    public Pager<EventGroupVO> findEventGroupList(EventGroupDTO dto, Pager<EventGroupVO> pager) {
        return null;
    }

    /**
    * 保存事件群聊关联
    *
    * @param dto
    * @return
    */
    @Override
    public EventGroupVO saveEventGroup(EventGroupDTO dto) {
        return null;
    }

    /**
    * 查询事件群聊关联详情
    *
    * @param id
    * @return
    */
    @Override
    public EventGroupVO getEventGroup(String id) {
        return null;
    }

    /**
    * 删除事件群聊关联
    *
    * @param id
    * @return
    */
    @Override
    public void deleteEventGroup(String id) {}

}