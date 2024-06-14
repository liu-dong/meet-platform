package com.dcsec.server.web.controller;

import com.dcsec.server.web.model.dto.EvidenceLogDTO;
import com.dcsec.server.web.model.vo.EvidenceLogVO;
import com.dcsec.server.web.service.EvidenceLogService;
import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 *  操作日志
 *
 *  @author LD
 */
@RestController
@RequestMapping("/evidenceLog")
public class EvidenceLogController {

    @Resource
    EvidenceLogService evidenceLogService;

    /**
     * 查询操作日志列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @GetMapping("/findEvidenceLogList")
    public ResponseResult findEvidenceLogList(EvidenceLogDTO dto, Pager<EvidenceLogVO> pager) {
        Pager<EvidenceLogVO> result = evidenceLogService.findEvidenceLogList(dto, pager);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 保存操作日志
     *
     * @param dto
     * @return
     */
    @PostMapping("/saveEvidenceLog")
    public ResponseResult saveEvidenceLog(@RequestBody EvidenceLogDTO dto) {
        String result = evidenceLogService.saveEvidenceLog(dto);
        return ResponseResult.success(result, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
     * 查询操作日志
     *
     * @param id
     * @return
     */
    @GetMapping("/getEvidenceLog")
    public ResponseResult getEvidenceLog(String id) {
        EvidenceLogVO result = evidenceLogService.getEvidenceLog(id);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 删除操作日志
     *
     * @param id
     * @return
     */
    @PostMapping("/deleteEvidenceLog")
    public ResponseResult deleteEvidenceLog(String id) {
        evidenceLogService.deleteEvidenceLog(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }
}
