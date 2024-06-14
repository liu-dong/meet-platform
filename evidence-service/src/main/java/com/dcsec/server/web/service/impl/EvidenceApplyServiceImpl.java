package com.dcsec.server.web.service.impl;

import com.dcsec.server.web.model.dto.EvidenceApplyDTO;
import com.dcsec.server.web.model.vo.EvidenceApplyVO;
import com.dcsec.server.web.service.EvidenceApplyService;
import com.dcsec.server.web.dao.EvidenceApplyRepository;
import org.springframework.stereotype.Service;
import com.dong.commoncore.model.Pager;

import javax.annotation.Resource;

@Service
public class EvidenceApplyServiceImpl implements EvidenceApplyService {

    @Resource
    EvidenceApplyRepository evidenceApplyRepository;

    /**
     * 查询物证申请列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @Override
    public Pager<EvidenceApplyVO> findEvidenceApplyList(EvidenceApplyDTO dto, Pager<EvidenceApplyVO> pager) {
        return null;
    }

    /**
     * 保存物证申请
     *
     * @param dto
     * @return
     */
    @Override
    public String saveEvidenceApply(EvidenceApplyDTO dto) {
        return null;
    }

    /**
     * 查询物证申请详情
     *
     * @param id
     * @return
     */
    @Override
    public EvidenceApplyVO getEvidenceApply(String id) {
        return null;
    }

    /**
     * 删除物证申请
     *
     * @param id
     * @return
     */
    @Override
    public void deleteEvidenceApply(String id) {}

}
