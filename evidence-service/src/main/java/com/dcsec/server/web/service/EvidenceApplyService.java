package com.dcsec.server.web.service;

import com.dcsec.server.web.model.dto.EvidenceApplyDTO;
import com.dcsec.server.web.model.vo.EvidenceApplyVO;
import com.dong.commoncore.model.Pager;

/**
 *  物证申请
 *
 *  @author LD
 */
public interface EvidenceApplyService {

    /**
     * 查询物证申请列表
     *
     * @param dto
     * @param pager
     * @return
     */
    Pager<EvidenceApplyVO> findEvidenceApplyList(EvidenceApplyDTO dto, Pager<EvidenceApplyVO> pager);

    /**
     * 保存物证申请
     *
     * @param dto
     * @return
     */
    String saveEvidenceApply(EvidenceApplyDTO dto);

    /**
     * 查询物证申请详情
     *
     * @param id
     * @return
     */
    EvidenceApplyVO getEvidenceApply(String id);

    /**
     * 删除物证申请
     *
     * @param id
     * @return
     */
    void deleteEvidenceApply(String id);

}
