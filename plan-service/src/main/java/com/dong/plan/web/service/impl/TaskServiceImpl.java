package com.dong.plan.web.service.impl;

import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.Pagination;
import com.dong.plan.web.dao.TaskRepository;
import com.dong.plan.web.model.dto.TaskDTO;
import com.dong.plan.web.model.vo.TaskVO;
import com.dong.plan.web.service.TaskService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class TaskServiceImpl implements TaskService {

    @Resource
    TaskRepository taskRepository;

    /**
     * 查询任务列表
     *
     * @param dto
     * @param pagination
     * @return
     */
    @Override
    public PageVO<TaskVO> findTaskList(TaskDTO dto, Pagination pagination) {
        return null;
    }

    /**
     * 保存任务
     *
     * @param dto
     * @return
     */
    @Override
    public String saveTask(TaskDTO dto) {
        return null;
    }

    /**
     * 查询任务详情
     *
     * @param id
     * @return
     */
    @Override
    public TaskVO getTask(String id) {
        return null;
    }

    /**
     * 删除任务
     *
     * @param id
     * @return
     */
    @Override
    public void deleteTask(String id) {
    }

}
