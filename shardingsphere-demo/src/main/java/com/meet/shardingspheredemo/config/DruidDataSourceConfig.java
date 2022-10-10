/*
package com.meet.shardingspheredemo.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceBuilder;
import org.apache.shardingsphere.driver.api.ShardingSphereDataSourceFactory;
import org.apache.shardingsphere.infra.config.RuleConfiguration;
import org.apache.shardingsphere.infra.config.algorithm.ShardingSphereAlgorithmConfiguration;
import org.apache.shardingsphere.sharding.api.config.ShardingRuleConfiguration;
import org.apache.shardingsphere.sharding.api.config.rule.ShardingTableRuleConfiguration;
import org.apache.shardingsphere.sharding.api.config.strategy.sharding.StandardShardingStrategyConfiguration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.orm.jpa.JpaProperties;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.orm.jpa.EntityManagerFactoryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.persistence.EntityManager;
import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.*;

*/
/**
 * @author liudong 2022/10/9
 *//*

@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(entityManagerFactoryRef = "entityManagerFactory",
        transactionManagerRef = "transactionManager",
        basePackages = {"com.meet.**.dao"})//指定需要扫描的dao所在包
public class DruidDataSourceConfig {

    @Autowired
    private JpaProperties jpaProperties;


    //@Bean(name = "dataSource")
    //@ConfigurationProperties(prefix = "spring.datasource.druid")
    //@Primary
    //public DruidDataSource dataSource() {
    //    return DruidDataSourceBuilder.create().build();
    //}

    @Bean(name = "dataSource")
    @ConfigurationProperties(prefix = "spring.datasource.druid")
    @Primary
    public DataSource dataSource() throws SQLException {
        DruidDataSource druidDataSource = DruidDataSourceBuilder.create().build();
        Properties properties = new Properties();
        properties.put("sql-show", true);
        return ShardingSphereDataSourceFactory.createDataSource(druidDataSource, createShardingRuleConfiguration(), properties);
    }

    private Collection<RuleConfiguration> createShardingRuleConfiguration() {
        ShardingRuleConfiguration ruleConfiguration = new ShardingRuleConfiguration();
        ruleConfiguration.getTables().add(getPatrolTaskRecordTableRuleConfiguration());
        Properties props = new Properties();
        props.put("datetime-pattern", "yyyy-MM-dd HH:mm:ss");
        props.put("datetime-lower", "2021-03-01 00:00:00");
        props.put("datetime-upper", "2022-10-01 00:00:00");
        props.put("sharding-suffix-pattern", "yyyyMM");
        props.put("datetime-interval-amount", "1");
        props.put("datetime-interval-unit", "MONTHS");
        ruleConfiguration.setDefaultTableShardingStrategy(new StandardShardingStrategyConfiguration("creation_time", "database-interval"));
        ruleConfiguration.getShardingAlgorithms().put("database-interval", new ShardingSphereAlgorithmConfiguration("INTERVAL", props));
        return Collections.singleton(ruleConfiguration);
    }

    private ShardingTableRuleConfiguration getPatrolTaskRecordTableRuleConfiguration() {
        return new ShardingTableRuleConfiguration("tbl_p_task_record", "patrol.tbl_p_task_record_$->{202103..202112},patrol.tbl_p_task_record_$->{202201..202210}");
    }

    */
/**
     * 指定需要扫描的实体包实现与数据库关联
     *
     * @param builder
     * @return
     *//*

    @Primary
    @Bean(name = "entityManagerFactory")
    public LocalContainerEntityManagerFactoryBean entityManagerFactory(EntityManagerFactoryBuilder builder, @Qualifier("dataSource") DataSource dataSource) {
        return builder
                .dataSource(dataSource)
                .properties(getVendorProperties())
                .packages("com.meet.**.entity")//指定需要扫描的entity所在包
                .build();
    }

    @Primary
    @Bean(name = "entityManager")
    public EntityManager entityManager(@Qualifier("entityManagerFactory") LocalContainerEntityManagerFactoryBean localContainerEntityManagerFactoryBean) {
        return localContainerEntityManagerFactoryBean.getObject().createEntityManager();
    }


    */
/**
     * 通过jpaProperties指定hibernate数据库方言以及在控制台打印sql语句
     *
     * @return
     *//*

    private Map<String, String> getVendorProperties() {
        Map<String, String> map = jpaProperties.getProperties();
        map.put("hibernate.dialect", "org.hibernate.dialect.MySQL57Dialect");
        map.put("hibernate.show_sql", "true");
        return map;
    }

    */
/**
     * 创建事务管理
     *
     * @return
     *//*

    @Bean(name = "transactionManager")
    @Primary
    PlatformTransactionManager transactionManager(@Qualifier("entityManagerFactory") LocalContainerEntityManagerFactoryBean localContainerEntityManagerFactoryBean) {
        return new JpaTransactionManager(localContainerEntityManagerFactoryBean.getObject());
    }

    @Primary
    @Bean(name = "jdbcTemplate")
    public JdbcTemplate jdbcTemplate(@Qualifier("dataSource") DataSource dataSource) {
        return new JdbcTemplate(dataSource);
    }

}
*/
