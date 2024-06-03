package com.dong.event.web.service.impl;

import com.dong.commoncore.constant.CommonConstant;
import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.Pagination;
import com.dong.commoncore.util.CommonUtils;
import com.dong.event.enums.RelationTypeEnum;
import com.dong.event.web.dao.EventGroupRepository;
import com.dong.event.web.entity.EventGroup;
import com.dong.event.web.model.dto.EventGroupDTO;
import com.dong.event.web.model.vo.EventGroupVO;
import com.dong.event.web.service.EventGroupService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class EventGroupServiceImpl implements EventGroupService {

    @Resource
    EventGroupRepository eventGroupRepository;

    /**
    * 查询事件群聊关联列表
    *
    * @param dto
    * @param pagination
    * @return
    */
    @Override
    public PageVO<EventGroupVO> findEventGroupList(EventGroupDTO dto, Pagination pagination) {
        return null;
    }

    /**
     * 保存事件群聊关联
     *
     * @param dto
     * @return
     */
    @Override
    public EventGroup saveEventGroup(EventGroupDTO dto) {
        EventGroup entity = new EventGroup();
        entity.setId(CommonUtils.getUUID());
        entity.setEventCode(dto.getEventCode());
        entity.setGroupId(dto.getGroupId());
        entity.setCurrentStatus(dto.getCurrentStatus());
        entity.setRelationType(RelationTypeEnum.register.name());
        entity.setDeleteStatus(CommonConstant.NO);
        return eventGroupRepository.save(entity);
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
