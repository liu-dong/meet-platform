package com.dong.plan.web.controller;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import com.dong.plan.web.model.dto.TaskDTO;
import com.dong.plan.web.model.vo.TaskVO;
import com.dong.plan.web.service.TaskService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * 任务
 *
 * @author Lenovo
 */
@RestController
@RequestMapping("/task")
public class TaskController {

    @Resource
    TaskService taskService;

    /**
     * 查询任务列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @GetMapping("/findTaskList")
    public ResponseResult findTaskList(TaskDTO dto, Pager<TaskVO> pager) {
        Pager<TaskVO> result = taskService.findTaskList(dto, pager);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 保存任务
     *
     * @param dto
     * @return
     */
    @PostMapping("/saveTask")
    public ResponseResult saveTask(@RequestBody TaskDTO dto) {
        String result = taskService.saveTask(dto);
        return ResponseResult.success(result, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
     * 查询任务
     *
     * @param id
     * @return
     */
    @GetMapping("/getTask")
    public ResponseResult getTask(String id) {
        TaskVO result = taskService.getTask(id);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 删除任务
     *
     * @param id
     * @return
     */
    @PostMapping("/deleteTask")
    public ResponseResult deleteTask(String id) {
        taskService.deleteTask(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }
}
