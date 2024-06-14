package com.dcsec.server.web.controller;

import com.dcsec.server.web.model.dto.EvidenceDTO;
import com.dcsec.server.web.model.vo.EvidenceVO;
import com.dcsec.server.web.service.EvidenceService;
import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 *  物证
 *
 *  @author LD
 */
@RestController
@RequestMapping("/evidence")
public class EvidenceController {

    @Resource
    EvidenceService evidenceService;

    /**
     * 查询物证列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @GetMapping("/findEvidenceList")
    public ResponseResult findEvidenceList(EvidenceDTO dto, Pager<EvidenceVO> pager) {
        Pager<EvidenceVO> result = evidenceService.findEvidenceList(dto, pager);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 保存物证
     *
     * @param dto
     * @return
     */
    @PostMapping("/saveEvidence")
    public ResponseResult saveEvidence(@RequestBody EvidenceDTO dto) {
        String result = evidenceService.saveEvidence(dto);
        return ResponseResult.success(result, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
     * 查询物证
     *
     * @param id
     * @return
     */
    @GetMapping("/getEvidence")
    public ResponseResult getEvidence(String id) {
        EvidenceVO result = evidenceService.getEvidence(id);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 删除物证
     *
     * @param id
     * @return
     */
    @PostMapping("/deleteEvidence")
    public ResponseResult deleteEvidence(String id) {
        evidenceService.deleteEvidence(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }
}
