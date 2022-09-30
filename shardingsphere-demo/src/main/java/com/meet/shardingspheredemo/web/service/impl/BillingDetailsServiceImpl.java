package com.meet.shardingspheredemo.web.service.impl;

import com.meet.commoncore.dao.CommonDao;
import com.meet.commoncore.exception.GlobalException;
import com.meet.commoncore.model.Pager;
import com.meet.commoncore.util.CurrentUserUtils;
import com.meet.commoncore.util.DateFormUtils;
import com.meet.shardingspheredemo.web.dao.BillingDetailsJpaDao;
import com.meet.shardingspheredemo.web.entity.BillingDetails;
import com.meet.shardingspheredemo.web.model.BillingDetailsDTO;
import com.meet.shardingspheredemo.web.service.BillingDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.math.RoundingMode;
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
        sql.append(" remark,create_time createTime,update_time updateTime,create_user_id createUserId,update_user_id updateUserId ");
        sql.append(" FROM billing_details ");
        sql.append(" WHERE 1=1 ");
        if (dto.getSpendingType() != null) {
            sql.append(" AND spending_type = ? ");
            params.add(dto.getSpendingType());
        }
        if (dto.getStartCreateTime() != null) {
            sql.append(" AND create_time >= ? ");
            params.add(dto.getStartCreateTime());
        }
        if (dto.getEndCreateTime() != null) {
            sql.append(" AND create_time < ? ");
            params.add(dto.getEndCreateTime());
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
        /*if (CurrentUserUtils.currentUser() != null){
            sql.append("AND create_user_id = ? ");
            params.add(CurrentUserUtils.getUsername());
        }*/
        sql.append(" ORDER BY record_time DESC ");
        return commonDao.findListBySql(pager, sql, params);
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
            if (StringUtils.isEmpty(dto.getCreateTime())) {
                entity.setCreateTime(new Date());
            }
            entity.setCreateUserId(dto.getCreateUserId());
        } else {
            entity = billingDetailsJpaDao.getOne(dto.getId());
        }
        entity.setSpendingType(dto.getSpendingType());
        entity.setAmountPaid(dto.getAmountPaid());
        entity.setRemark(dto.getRemark());
        entity.setRecordTime(DateFormUtils.formatDate(dto.getRecordTime()));
        entity.setUpdateTime(new Date());
        entity.setUpdateUserId(dto.getUpdateUserId());
        return entity;
    }

    @Override
    public List<Map<String, Object>> statisticsBillingBySpendingType(String date) {
        if (StringUtils.isEmpty(date)) {
            throw new GlobalException(500, "日期为空");
        }
        StringBuilder sql = new StringBuilder();
        List<Object> params = new ArrayList<>();
        sql.append(" SELECT spending_type spendingType,SUM(amount_paid) sum FROM billing_details  ");
        if (date.length() > 4) {
            sql.append(" WHERE DATE_FORMAT(record_time,'%Y-%m') = ? ");
        } else {
            sql.append(" WHERE DATE_FORMAT(record_time,'%Y') = ? ");
        }
        params.add(date);
        sql.append(" GROUP BY spending_type ");
        return commonDao.findListMapBySql(sql, params);
    }

    @Override
    public Map<String, BigDecimal> statisticsBillingByMonth(String year) {
        Map<String, BigDecimal> result = buildMonthMap(year);
        if (StringUtils.isEmpty(year)) {
            throw new GlobalException(500, "日期为空");
        }
        StringBuilder sql = new StringBuilder();
        List<Object> params = new ArrayList<>();
        sql.append(" SELECT DATE_FORMAT(record_time,'%Y-%m') monthly,SUM(amount_paid) sum FROM billing_details  ");
        sql.append(" WHERE DATE_FORMAT(record_time,'%Y') = ? ");
        params.add(year);
        sql.append(" GROUP BY DATE_FORMAT(record_time,'%Y-%m') ");
        List<Map<String, Object>> listMap = commonDao.findListMapBySql(sql, params);
        for (Map<String, Object> map : listMap) {
            result.put((String) map.get("monthly"), (BigDecimal) map.get("sum"));
        }
        return result;
    }

    @Override
    public Map<String, BigDecimal> statisticsBilling(String date) {
        Map<String, BigDecimal> result = new HashMap<>();
        List<BillingDetails> list = billingDetailsJpaDao.findByRecordTimeStartingWith(date + "%");
        //总支出
        BigDecimal amountSum = list.stream()
                // 将BillingDetails对象的amountPaid取出来map为BigDecimal
                .map(BillingDetails::getAmountPaid)
                // 使用reduce聚合函数,实现累加器
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        //最大一笔支出
        BigDecimal amountMax = list.stream().map(BillingDetails::getAmountPaid).reduce(BigDecimal.ZERO, BigDecimal::max);
        //平均每日/月支出
        BigDecimal amountAvg;
        if (date.length() > 4) {
            amountAvg = amountSum.divide(BigDecimal.valueOf(30), 2, RoundingMode.HALF_UP);
        } else {
            amountAvg = amountSum.divide(BigDecimal.valueOf(365), 2, RoundingMode.HALF_UP);
        }
        result.put("amountSum", amountSum);
        result.put("amountMax", amountMax);
        result.put("amountAvg", amountAvg);
        return result;
    }

    /**
     * 构建12个月份Map
     *
     * @param year
     * @return
     */
    private Map<String, BigDecimal> buildMonthMap(String year) {
        Map<String, BigDecimal> result = new HashMap<>(12);
        for (int i = 1; i <= 12; i++) {
            if (i < 10) {
                result.put(year + "-0" + i, BigDecimal.valueOf(0));
            } else {
                result.put(year + "-" + i, BigDecimal.valueOf(0));
            }
        }
        return result;
    }
}
