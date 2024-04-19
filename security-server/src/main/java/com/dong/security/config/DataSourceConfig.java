package com.dong.security.config;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.orm.jpa.JpaProperties;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
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
import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;
import java.util.Map;

/**
 * @author liudong
 * @date 2019/12/30 11:24
 */
@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(basePackages = {"com.dong.user.dao"})
public class DataSourceConfig {

    @Resource
    private JpaProperties jpaProperties;


    /**
     * 数据源
     *
     * @return
     */
    @Primary
    @Bean(name = "dataSource")
    @ConfigurationProperties(prefix = "spring.datasource")
    public DataSource dataSource() {
        return DataSourceBuilder.create().build();
    }

    /**
     * 指定需要扫描的实体包实现与数据库关联
     *
     * @param builder
     * @return
     */
    @Primary
    @Bean(name = "entityManagerFactory")
    public LocalContainerEntityManagerFactoryBean entityManagerFactory(
            EntityManagerFactoryBuilder builder,
            DataSource dataSource) {
        return builder
                .dataSource(dataSource)
                .properties(getVendorProperties())
                .packages("com.dong.user.entity")
                .build();
    }

    @Primary
    @Bean(name = "entityManager")
    public EntityManager entityManager(@Qualifier("entityManagerFactory") EntityManagerFactory entityManagerFactory) {
        return entityManagerFactory.createEntityManager();
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
    @Bean(name = "transactionManager")
    public PlatformTransactionManager transactionManager(
            @Qualifier("entityManagerFactory") EntityManagerFactory entityManagerFactory) {
        return new JpaTransactionManager(entityManagerFactory);
    }

    @Primary
    @Bean(name = "jdbcTemplate")
    public JdbcTemplate jdbcTemplate(DataSource dataSource) {
        return new JdbcTemplate(dataSource);
    }
}
