package com.dong.plan.config;

import com.alibaba.druid.pool.DruidDataSource;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.orm.jpa.JpaProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
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

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.Map;
import java.util.Objects;

/**
 * Druid连接池配置
 * 指定需要扫描的dao所在包：@EnableJpaRepositories(basePackages = {"com.meet.**.dao"})
 *
 * @author liudong
 * @date 2019/12/30 11:24
 */
@Configuration
@EnableConfigurationProperties({DruidDataSourcePropertiesConfig.class})
@EnableTransactionManagement
@EnableJpaRepositories(
        entityManagerFactoryRef = "planEntityManagerFactory",
        transactionManagerRef = "planTransactionManager",
        basePackages = {"com.dong.plan.web.dao"}
)
public class PlanDataSourceConfig {

    @Resource
    private DruidDataSourcePropertiesConfig properties;
    @Resource
    private JpaProperties jpaProperties;

    /**
     * druid数据源
     * 表示如果存在这个Bean,则不会创建：@ConditionalOnMissingBean
     *
     * @return
     */
    @Primary
    @Bean(name = "planDataSource")
    public DataSource planDataSource() {
        DruidDataSource druidDataSource = new DruidDataSource();
        druidDataSource.setDriverClassName(properties.getDriverClassName());
        druidDataSource.setUrl(properties.getUrl());
        druidDataSource.setUsername(properties.getUsername());
        druidDataSource.setPassword(properties.getPassword());
        druidDataSource.setInitialSize(properties.getInitialSize());
        druidDataSource.setMinIdle(properties.getMinIdle());
        druidDataSource.setMaxActive(properties.getMaxActive());
        druidDataSource.setMaxWait(properties.getMaxWait());
        druidDataSource.setTimeBetweenEvictionRunsMillis(properties.getTimeBetweenEvictionRunsMillis());
        druidDataSource.setMinEvictableIdleTimeMillis(properties.getMinEvictableIdleTimeMillis());
        druidDataSource.setValidationQuery(properties.getValidationQuery());
        druidDataSource.setTestWhileIdle(properties.isTestWhileIdle());
        druidDataSource.setTestOnBorrow(properties.isTestOnBorrow());
        druidDataSource.setTestOnReturn(properties.isTestOnReturn());
        druidDataSource.setPoolPreparedStatements(properties.isPoolPreparedStatements());
        druidDataSource.setMaxPoolPreparedStatementPerConnectionSize(properties.getMaxPoolPreparedStatementPerConnectionSize());
        try {
            druidDataSource.setFilters(properties.getFilters());
            druidDataSource.init();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return druidDataSource;
    }

    /**
     * 指定需要扫描的实体包实现与数据库关联
     *
     * @param builder
     * @return
     */
    @Primary
    @Bean(name = "planEntityManagerFactory")
    public LocalContainerEntityManagerFactoryBean planEntityManagerFactory(
            EntityManagerFactoryBuilder builder,
            @Qualifier("planDataSource") DataSource dataSource) {
        return builder
                .dataSource(dataSource)
                .properties(getVendorProperties())
                .packages("com.dong.plan.web.entity")
                .build();
    }

    @Primary
    @Bean(name = "planEntityManager")
    public EntityManager planEntityManager(@Qualifier("planEntityManagerFactory") LocalContainerEntityManagerFactoryBean localContainerEntityManagerFactoryBean) {
        return Objects.requireNonNull(localContainerEntityManagerFactoryBean.getObject()).createEntityManager();
    }


    /**
     * 通过jpaProperties指定hibernate数据库方言以及在控制台打印sql语句
     *
     * @return
     */
    private Map<String, String> getVendorProperties() {
        Map<String, String> map = jpaProperties.getProperties();
        map.put("hibernate.dialect", "org.hibernate.dialect.MySQL57Dialect");
        map.put("hibernate.show_sql", "true");
        return map;
    }

    /**
     * 创建事务管理
     *
     * @return
     */
    @Primary
    @Bean(name = "planTransactionManager")
    PlatformTransactionManager planTransactionManager(@Qualifier("planEntityManagerFactory") LocalContainerEntityManagerFactoryBean localContainerEntityManagerFactoryBean) {
        return new JpaTransactionManager(Objects.requireNonNull(localContainerEntityManagerFactoryBean.getObject()));
    }

    @Primary
    @Bean(name = "planJdbcTemplate")
    public JdbcTemplate planJdbcTemplate(@Qualifier("planDataSource") DataSource dataSource) {
        return new JdbcTemplate(dataSource);
    }
}
