package com.dong.event.web.controller;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.Pagination;
import com.dong.commoncore.model.ResponseResult;
import com.dong.event.web.model.dto.EventFlowDTO;
import com.dong.event.web.model.vo.EventFlowVO;
import com.dong.event.web.service.EventFlowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
*  事件流程
*
*  @author liudong
*/
@RestController
@RequestMapping("/eventFlow")
public class EventFlowController {

    @Autowired
    EventFlowService eventFlowService;

    /**
    * 查询事件流程列表
    *
    * @param dto
    * @param pagination
    * @return
    */
    @PostMapping("/findEventFlowList")
    public ResponseResult findEventFlowList(@RequestBody EventFlowDTO dto, Pagination pagination) {
        PageVO<EventFlowVO> result = eventFlowService.findEventFlowList(dto, pagination);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
    * 保存事件流程
    *
    * @param dto
    * @return
    */
    @PostMapping("/saveEventFlow")
    public ResponseResult saveEventFlow(@RequestBody EventFlowDTO dto) {
        EventFlowVO result = eventFlowService.saveEventFlow(dto);
        return ResponseResult.success(result, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
    * 查询事件流程
    *
    * @param id
    * @return
    */
    @GetMapping("/getEventFlow")
    public ResponseResult getEventFlow(String id) {
        EventFlowVO result = eventFlowService.getEventFlow(id);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
    * 删除事件流程
    *
    * @param id
    * @return
    */
    @PostMapping("/deleteEventFlow")
    public ResponseResult deleteEventFlow(String id) {
        eventFlowService.deleteEventFlow(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }
}
