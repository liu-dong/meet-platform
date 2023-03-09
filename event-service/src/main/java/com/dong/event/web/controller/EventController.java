package com.dong.event.web.controller;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import com.dong.event.web.entity.Event;
import com.dong.event.web.model.dto.EventDTO;
import com.dong.event.web.model.vo.EventVO;
import com.dong.event.web.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
*  事件
*
*  @author liudong
*/
@RestController
@RequestMapping("/event")
public class EventController {

    @Autowired
    EventService eventService;

    /**
    * 查询事件列表
    *
    * @param dto
    * @param pager
    * @return
    */
    @PostMapping("/findEventList")
    public ResponseResult findEventList(@RequestBody EventDTO dto, Pager<EventVO> pager) {
        Pager<EventVO> result = eventService.findEventList(dto, pager);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
    * 保存事件
    *
    * @param dto
    * @return
    */
    @PostMapping("/saveEvent")
    public ResponseResult saveEvent(@RequestBody EventDTO dto) {
        Event result = eventService.saveEvent(dto);
        return ResponseResult.success(result, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
    * 查询事件
    *
    * @param id
    * @return
    */
    @GetMapping("/getEvent")
    public ResponseResult getEvent(String id) {
        EventVO result = eventService.getEvent(id);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
    * 删除事件
    *
    * @param id
    * @return
    */
    @PostMapping("/deleteEvent")
    public ResponseResult deleteEvent(String id) {
        eventService.deleteEvent(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }
}
