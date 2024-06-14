package com.dcsec.server.web.service;

import com.dcsec.server.web.model.dto.EvidenceDTO;
import com.dcsec.server.web.model.vo.EvidenceVO;
import com.dong.commoncore.model.Pager;

/**
 *  物证
 *
 *  @author LD
 */
public interface EvidenceService {

    /**
     * 查询物证列表
     *
     * @param dto
     * @param pager
     * @return
     */
    Pager<EvidenceVO> findEvidenceList(EvidenceDTO dto, Pager<EvidenceVO> pager);

    /**
     * 保存物证
     *
     * @param dto
     * @return
     */
    String saveEvidence(EvidenceDTO dto);

    /**
     * 查询物证详情
     *
     * @param id
     * @return
     */
    EvidenceVO getEvidence(String id);

    /**
     * 删除物证
     *
     * @param id
     * @return
     */
    void deleteEvidence(String id);

}
