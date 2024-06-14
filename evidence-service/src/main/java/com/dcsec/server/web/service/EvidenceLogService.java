package com.dcsec.server.web.service;

import com.dcsec.server.web.model.dto.EvidenceLogDTO;
import com.dcsec.server.web.model.vo.EvidenceLogVO;
import com.dong.commoncore.model.Pager;

/**
 *  操作日志
 *
 *  @author LD
 */
public interface EvidenceLogService {

    /**
     * 查询操作日志列表
     *
     * @param dto
     * @param pager
     * @return
     */
    Pager<EvidenceLogVO> findEvidenceLogList(EvidenceLogDTO dto, Pager<EvidenceLogVO> pager);

    /**
     * 保存操作日志
     *
     * @param dto
     * @return
     */
    String saveEvidenceLog(EvidenceLogDTO dto);

    /**
     * 查询操作日志详情
     *
     * @param id
     * @return
     */
    EvidenceLogVO getEvidenceLog(String id);

    /**
     * 删除操作日志
     *
     * @param id
     * @return
     */
    void deleteEvidenceLog(String id);

}
