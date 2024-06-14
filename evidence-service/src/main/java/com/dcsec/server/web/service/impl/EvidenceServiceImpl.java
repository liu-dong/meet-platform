package com.dcsec.server.web.service.impl;

import com.dcsec.server.web.model.dto.EvidenceDTO;
import com.dcsec.server.web.model.vo.EvidenceVO;
import com.dcsec.server.web.service.EvidenceService;
import com.dcsec.server.web.dao.EvidenceRepository;
import org.springframework.stereotype.Service;
import com.dong.commoncore.model.Pager;

import javax.annotation.Resource;

@Service
public class EvidenceServiceImpl implements EvidenceService {

    @Resource
    EvidenceRepository evidenceRepository;

    /**
     * 查询物证列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @Override
    public Pager<EvidenceVO> findEvidenceList(EvidenceDTO dto, Pager<EvidenceVO> pager) {
        return null;
    }

    /**
     * 保存物证
     *
     * @param dto
     * @return
     */
    @Override
    public String saveEvidence(EvidenceDTO dto) {
        return null;
    }

    /**
     * 查询物证详情
     *
     * @param id
     * @return
     */
    @Override
    public EvidenceVO getEvidence(String id) {
        return null;
    }

    /**
     * 删除物证
     *
     * @param id
     * @return
     */
    @Override
    public void deleteEvidence(String id) {}

}
