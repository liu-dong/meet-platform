package com.dong.plan.web.service;

import com.dong.commoncore.model.Pager;
import com.dong.plan.web.model.dto.TaskDTO;
import com.dong.plan.web.model.vo.TaskVO;

/**
 * 任务
 *
 * @author Lenovo
 */
public interface TaskService {

    /**
     * 查询任务列表
     *
     * @param dto
     * @param pager
     * @return
     */
    Pager<TaskVO> findTaskList(TaskDTO dto, Pager<TaskVO> pager);

    /**
     * 保存任务
     *
     * @param dto
     * @return
     */
    String saveTask(TaskDTO dto);

    /**
     * 查询任务详情
     *
     * @param id
     * @return
     */
    TaskVO getTask(String id);

    /**
     * 删除任务
     *
     * @param id
     * @return
     */
    void deleteTask(String id);

}
