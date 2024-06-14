package com.dcsec.server.web.controller;

import com.dcsec.server.web.model.dto.EvidenceApplyDTO;
import com.dcsec.server.web.model.vo.EvidenceApplyVO;
import com.dcsec.server.web.service.EvidenceApplyService;
import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 *  物证申请
 *
 *  @author LD
 */
@RestController
@RequestMapping("/evidenceApply")
public class EvidenceApplyController {

    @Resource
    EvidenceApplyService evidenceApplyService;

    /**
     * 查询物证申请列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @GetMapping("/findEvidenceApplyList")
    public ResponseResult findEvidenceApplyList(EvidenceApplyDTO dto, Pager<EvidenceApplyVO> pager) {
        Pager<EvidenceApplyVO> result = evidenceApplyService.findEvidenceApplyList(dto, pager);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 保存物证申请
     *
     * @param dto
     * @return
     */
    @PostMapping("/saveEvidenceApply")
    public ResponseResult saveEvidenceApply(@RequestBody EvidenceApplyDTO dto) {
        String result = evidenceApplyService.saveEvidenceApply(dto);
        return ResponseResult.success(result, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
     * 查询物证申请
     *
     * @param id
     * @return
     */
    @GetMapping("/getEvidenceApply")
    public ResponseResult getEvidenceApply(String id) {
        EvidenceApplyVO result = evidenceApplyService.getEvidenceApply(id);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 删除物证申请
     *
     * @param id
     * @return
     */
    @PostMapping("/deleteEvidenceApply")
    public ResponseResult deleteEvidenceApply(String id) {
        evidenceApplyService.deleteEvidenceApply(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }
}
