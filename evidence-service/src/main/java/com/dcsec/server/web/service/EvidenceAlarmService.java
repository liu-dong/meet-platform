package com.dcsec.server.web.service;

import com.dcsec.server.web.model.dto.EvidenceAlarmDTO;
import com.dcsec.server.web.model.vo.EvidenceAlarmVO;
import com.dong.commoncore.model.Pager;

/**
 *  物证告警
 *
 *  @author LD
 */
public interface EvidenceAlarmService {

    /**
     * 查询物证告警列表
     *
     * @param dto
     * @param pager
     * @return
     */
    Pager<EvidenceAlarmVO> findEvidenceAlarmList(EvidenceAlarmDTO dto, Pager<EvidenceAlarmVO> pager);

    /**
     * 保存物证告警
     *
     * @param dto
     * @return
     */
    String saveEvidenceAlarm(EvidenceAlarmDTO dto);

    /**
     * 查询物证告警详情
     *
     * @param id
     * @return
     */
    EvidenceAlarmVO getEvidenceAlarm(String id);

    /**
     * 删除物证告警
     *
     * @param id
     * @return
     */
    void deleteEvidenceAlarm(String id);

}
