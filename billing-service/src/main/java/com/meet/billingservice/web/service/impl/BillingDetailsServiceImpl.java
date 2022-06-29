package com.meet.billingservice.web.service.impl;

import com.meet.billingservice.util.DateFormUtils;
import com.meet.billingservice.web.dao.BillingDetailsJpaDao;
import com.meet.billingservice.web.entity.BillingDetails;
import com.meet.billingservice.web.model.BillingDetailsDTO;
import com.meet.billingservice.web.service.BillingDetailsService;
import com.meet.commoncore.dao.CommonDao;
import com.meet.commoncore.model.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.text.ParseException;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 账单明细表(BillingDetails)表服务实现类
 *
 * @author zhangjiaxin
 * @since 2022-05-28 00:18:54
 */
@Service
public class BillingDetailsServiceImpl implements BillingDetailsService {

    @Autowired
    private BillingDetailsJpaDao billingDetailsJpaDao;

    @Autowired
    private CommonDao commonDao;

    @Override
    public BillingDetails saveBilling(BillingDetailsDTO dto) throws ParseException {
        BillingDetails billingDetails = convertEntity(dto);
        billingDetailsJpaDao.save(billingDetails);
        return billingDetails;
    }

    @Override
    public BillingDetails findBilling(String id) throws Exception {
        if (StringUtils.isEmpty(id)) {
            throw new Exception("主键不能为空");
        }
        return billingDetailsJpaDao.getOne(id);
    }

    @Override
    public void deleteBilling(String id) throws Exception {
        if (StringUtils.isEmpty(id)) {
            throw new Exception("主键不能为空");
        }
        billingDetailsJpaDao.deleteById(id);
    }

    @Override
    public Pager<BillingDetailsDTO> findBillingList(BillingDetailsDTO dto, Pager<BillingDetailsDTO> pager) {
        StringBuilder sql = new StringBuilder();
        List<Object> params = new ArrayList<>();
        sql.append(" SELECT id,DATE_FORMAT(record_time,'%Y-%m-%d') recordTime,spending_type spendingType,amount_paid amountPaid, ");
        sql.append(" remark,create_time createTime,update_time updateTime ");
        sql.append(" FROM billing_details ");
        sql.append(" WHERE 1=1 ");
        if (dto.getSpendingType() != null) {
            sql.append(" AND spending_type = ? ");
            params.add(dto.getSpendingType());
        }
        if (!StringUtils.isEmpty(dto.getRecordTime())) {
            int length = dto.getRecordTime().length();
            if (length == 4) {
                //记录时间——年
                sql.append(" AND DATE_FORMAT(record_time,'%Y') = ? ");
            } else if (length == 7) {
                //记录时间——月
                sql.append(" AND DATE_FORMAT(record_time,'%Y-%m') = ? ");
            } else if (length == 10) {
                //记录时间——日
                sql.append(" AND DATE_FORMAT(record_time,'%Y-%m-%d') = ? ");
            } else {
                sql.append(" AND DATE_FORMAT(record_time,'%Y-%m-%d') >= ? ");
            }
            params.add(dto.getRecordTime());
        }
        sql.append(" ORDER BY record_time DESC ");
        return commonDao.findListBySql(pager, sql, params, BillingDetailsDTO.class);
    }

    @Override
    public Map<String, List<BillingDetailsDTO>> findBillingListGroup(BillingDetailsDTO dto) {
        Pager<BillingDetailsDTO> pager = new Pager<>();
        Pager<BillingDetailsDTO> resultPage = findBillingList(dto, pager);
        List<BillingDetailsDTO> dataList = resultPage.getDataList();
        return dataList.stream().collect(Collectors.groupingBy(BillingDetailsDTO::getRecordTime));
    }

    private BillingDetails convertEntity(BillingDetailsDTO dto) throws ParseException {
        BillingDetails entity = new BillingDetails();
        if (StringUtils.isEmpty(dto.getId())) {
            entity.setId(UUID.randomUUID().toString());
            entity.setCreateTime(new Date());
        } else {
            entity = billingDetailsJpaDao.getOne(dto.getId());
        }
        entity.setSpendingType(dto.getSpendingType());
        entity.setAmountPaid(dto.getAmountPaid());
        entity.setRemark(dto.getRemark());
        entity.setRecordTime(DateFormUtils.formatDate(dto.getRecordTime()));
        entity.setUpdateTime(new Date());
        return entity;
    }

}
