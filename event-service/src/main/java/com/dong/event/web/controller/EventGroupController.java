package com.dong.event.web.controller;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.Pagination;
import com.dong.commoncore.model.ResponseResult;
import com.dong.event.web.entity.EventGroup;
import com.dong.event.web.model.dto.EventGroupDTO;
import com.dong.event.web.model.vo.EventGroupVO;
import com.dong.event.web.service.EventGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
*  事件群聊关联
*
*  @author liudong
*/
@RestController
@RequestMapping("/eventGroup")
public class EventGroupController {

    @Autowired
    EventGroupService eventGroupService;

    /**
    * 查询事件群聊关联列表
    *
    * @param dto
    * @param pagination
    * @return
    */
    @PostMapping("/findEventGroupList")
    public ResponseResult findEventGroupList(@RequestBody EventGroupDTO dto, Pagination pagination) {
        PageVO<EventGroupVO> result = eventGroupService.findEventGroupList(dto, pagination);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
    * 保存事件群聊关联
    *
    * @param dto
    * @return
    */
    @PostMapping("/saveEventGroup")
    public ResponseResult saveEventGroup(@RequestBody EventGroupDTO dto) {
        EventGroup result = eventGroupService.saveEventGroup(dto);
        return ResponseResult.success(result, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
    * 查询事件群聊关联
    *
    * @param id
    * @return
    */
    @GetMapping("/getEventGroup")
    public ResponseResult getEventGroup(String id) {
        EventGroupVO result = eventGroupService.getEventGroup(id);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
    * 删除事件群聊关联
    *
    * @param id
    * @return
    */
    @PostMapping("/deleteEventGroup")
    public ResponseResult deleteEventGroup(String id) {
        eventGroupService.deleteEventGroup(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }
}
