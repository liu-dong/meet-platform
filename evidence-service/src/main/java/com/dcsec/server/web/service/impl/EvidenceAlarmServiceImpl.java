package com.dcsec.server.web.service.impl;

import com.dcsec.server.web.model.dto.EvidenceAlarmDTO;
import com.dcsec.server.web.model.vo.EvidenceAlarmVO;
import com.dcsec.server.web.service.EvidenceAlarmService;
import com.dcsec.server.web.dao.EvidenceAlarmRepository;
import org.springframework.stereotype.Service;
import com.dong.commoncore.model.Pager;

import javax.annotation.Resource;

@Service
public class EvidenceAlarmServiceImpl implements EvidenceAlarmService {

    @Resource
    EvidenceAlarmRepository evidenceAlarmRepository;

    /**
     * 查询物证告警列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @Override
    public Pager<EvidenceAlarmVO> findEvidenceAlarmList(EvidenceAlarmDTO dto, Pager<EvidenceAlarmVO> pager) {
        return null;
    }

    /**
     * 保存物证告警
     *
     * @param dto
     * @return
     */
    @Override
    public String saveEvidenceAlarm(EvidenceAlarmDTO dto) {
        return null;
    }

    /**
     * 查询物证告警详情
     *
     * @param id
     * @return
     */
    @Override
    public EvidenceAlarmVO getEvidenceAlarm(String id) {
        return null;
    }

    /**
     * 删除物证告警
     *
     * @param id
     * @return
     */
    @Override
    public void deleteEvidenceAlarm(String id) {}

}
