package com.dong.admin.config;

import com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import javax.sql.DataSource;

/**
 * @author liudong
 * @date 2023/8/30
 */
@Configuration
public class DataSourceConfig {

    /**
     * druid数据源
     * <p>
     * 表示如果存在这个Bean,则不会创建：@ConditionalOnMissingBean
     *
     * @return
     */
    @Primary
    @ConfigurationProperties(prefix = "spring.datasource.admin")
    @Bean(name = "adminDataSource")
    public DataSource adminDataSource() {
        return DruidDataSourceBuilder.create().build();
    }

}
