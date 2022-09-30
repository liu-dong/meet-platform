package com.meet.shardingspheredemo.sharding;

import org.apache.shardingsphere.sharding.api.sharding.standard.PreciseShardingValue;
import org.apache.shardingsphere.sharding.api.sharding.standard.RangeShardingValue;
import org.apache.shardingsphere.sharding.api.sharding.standard.StandardShardingAlgorithm;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collection;

/**
 * @author liudong 2022/9/29
 */
@Component
public class DateShardingAlgorithm implements StandardShardingAlgorithm<String> {

    @Override
    public String doSharding(Collection<String> collection, PreciseShardingValue<String> preciseShardingValue) {
        String value = preciseShardingValue.getValue();
        if (StringUtils.isEmpty(value)) {
            return collection.stream().findFirst().get();
        }
        LocalDateTime dateTime = LocalDateTime.parse(value, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        String tableSuffix = dateTime.format(DateTimeFormatter.ofPattern("yyyyMM"));
        String logicTableName = preciseShardingValue.getLogicTableName();
        String table = logicTableName.concat("-").concat(tableSuffix);
        return collection.stream().filter(s -> s.equals(table)).findFirst().orElseThrow(() -> new RuntimeException("此表不存在:" + table));
    }

    @Override
    public Collection<String> doSharding(Collection<String> collection, RangeShardingValue<String> rangeShardingValue) {
        return null;
    }

    @Override
    public void init() {

    }

    @Override
    public String getType() {
        return null;
    }
}
