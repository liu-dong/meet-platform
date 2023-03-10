package com.dong.event.web.service.impl;

import com.dong.commoncore.constant.CommonConstant;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.util.CommonUtils;
import com.dong.commoncore.util.CurrentUserUtils;
import com.dong.event.enums.EventStatusEnum;
import com.dong.event.util.EventUtils;
import com.dong.event.web.dao.EventJpaDao;
import com.dong.event.web.entity.Event;
import com.dong.event.web.model.dto.EventDTO;
import com.dong.event.web.model.vo.EventVO;
import com.dong.event.web.service.EventService;
import org.apache.commons.lang3.StringUtils;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class EventServiceImpl implements EventService {

    @Resource
    EventJpaDao eventJpaDao;

    /**
     * 查询事件列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @Override
    public Pager<EventVO> findEventList(EventDTO dto, Pager<EventVO> pager) {
        List<Event> all = eventJpaDao.findAll();
        for (Event event : all) {
            EventVO vo = new EventVO();
            BeanUtils.copyProperties(event, vo);
            pager.getDataList().add(vo);
        }
        return pager;
    }

    /**
     * 保存事件
     *
     * @param dto
     * @return
     */
    @Override
    public Event saveEvent(EventDTO dto) {
        Event entity = new Event();
        BeanUtils.copyProperties(dto, entity);
        if (StringUtils.isBlank(dto.getId())) {
            entity.setId(CommonUtils.getUUID());
            entity.setCreateTime(new Date());
            entity.setCreateUserId(CurrentUserUtils.getUserId());
            entity.setOperaterId(CurrentUserUtils.getUserId());
            entity.setDeleteStatus(CommonConstant.NO);
            entity.setEventCode(CommonUtils.getRandomSixNum());
            entity.setEventStatus(EventStatusEnum.register.name());
        } else {
            Event event = eventJpaDao.findById(dto.getId()).orElse(new Event());
            entity.setId(event.getId());
        }
        entity.setUpdateTime(new Date());
        entity.setUpdateUserId(CurrentUserUtils.getUserId());
        entity.setExpectCompleteDate(EventUtils.getExpectCompleteDate(dto.getUrgencyDegree()));
        entity.setExpectWarnDate(EventUtils.getExpectWarnDate(dto.getUrgencyDegree()));
        return eventJpaDao.save(entity);
    }


    /**
     * 查询事件详情
     *
     * @param id
     * @return
     */
    @Override
    public EventVO getEvent(String id) {
        Assert.notNull(id, "id不能为空");
        Event event = eventJpaDao.findById(id).orElseThrow(() -> new GlobalException("无此事件"));
        return convertVO(event);
    }

    @NotNull
    private EventVO convertVO(Event event) {
        EventVO vo = new EventVO();
        BeanUtils.copyProperties(event, vo);
        return vo;
    }

    /**
     * 删除事件
     *
     * @param id
     * @return
     */
    @Override
    public void deleteEvent(String id) {
        Assert.notNull(id, "id不能为空");
        Event event = eventJpaDao.findById(id).orElse(new Event());
        event.setDeleteStatus(CommonConstant.YES);
        event.setUpdateTime(new Date());
        eventJpaDao.save(event);
    }

}