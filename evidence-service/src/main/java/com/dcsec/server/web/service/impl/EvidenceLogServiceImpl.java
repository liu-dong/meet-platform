package com.dcsec.server.web.service.impl;

import com.dcsec.server.web.model.dto.EvidenceLogDTO;
import com.dcsec.server.web.model.vo.EvidenceLogVO;
import com.dcsec.server.web.service.EvidenceLogService;
import com.dcsec.server.web.dao.EvidenceLogRepository;
import org.springframework.stereotype.Service;
import com.dong.commoncore.model.Pager;

import javax.annotation.Resource;

@Service
public class EvidenceLogServiceImpl implements EvidenceLogService {

    @Resource
    EvidenceLogRepository evidenceLogRepository;

    /**
     * 查询操作日志列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @Override
    public Pager<EvidenceLogVO> findEvidenceLogList(EvidenceLogDTO dto, Pager<EvidenceLogVO> pager) {
        return null;
    }

    /**
     * 保存操作日志
     *
     * @param dto
     * @return
     */
    @Override
    public String saveEvidenceLog(EvidenceLogDTO dto) {
        return null;
    }

    /**
     * 查询操作日志详情
     *
     * @param id
     * @return
     */
    @Override
    public EvidenceLogVO getEvidenceLog(String id) {
        return null;
    }

    /**
     * 删除操作日志
     *
     * @param id
     * @return
     */
    @Override
    public void deleteEvidenceLog(String id) {}

}
