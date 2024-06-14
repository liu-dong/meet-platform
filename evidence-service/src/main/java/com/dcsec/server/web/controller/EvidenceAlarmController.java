package com.dcsec.server.web.controller;

import com.dcsec.server.web.model.dto.EvidenceAlarmDTO;
import com.dcsec.server.web.model.vo.EvidenceAlarmVO;
import com.dcsec.server.web.service.EvidenceAlarmService;
import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 *  物证告警
 *
 *  @author LD
 */
@RestController
@RequestMapping("/evidenceAlarm")
public class EvidenceAlarmController {

    @Resource
    EvidenceAlarmService evidenceAlarmService;

    /**
     * 查询物证告警列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @GetMapping("/findEvidenceAlarmList")
    public ResponseResult findEvidenceAlarmList(EvidenceAlarmDTO dto, Pager<EvidenceAlarmVO> pager) {
        Pager<EvidenceAlarmVO> result = evidenceAlarmService.findEvidenceAlarmList(dto, pager);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 保存物证告警
     *
     * @param dto
     * @return
     */
    @PostMapping("/saveEvidenceAlarm")
    public ResponseResult saveEvidenceAlarm(@RequestBody EvidenceAlarmDTO dto) {
        String result = evidenceAlarmService.saveEvidenceAlarm(dto);
        return ResponseResult.success(result, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
     * 查询物证告警
     *
     * @param id
     * @return
     */
    @GetMapping("/getEvidenceAlarm")
    public ResponseResult getEvidenceAlarm(String id) {
        EvidenceAlarmVO result = evidenceAlarmService.getEvidenceAlarm(id);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 删除物证告警
     *
     * @param id
     * @return
     */
    @PostMapping("/deleteEvidenceAlarm")
    public ResponseResult deleteEvidenceAlarm(String id) {
        evidenceAlarmService.deleteEvidenceAlarm(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }
}
