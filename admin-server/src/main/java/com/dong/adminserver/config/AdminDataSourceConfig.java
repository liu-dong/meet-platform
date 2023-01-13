package com.dong.adminserver.config;

import com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceBuilder;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.orm.jpa.JpaProperties;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.orm.jpa.EntityManagerFactoryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
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
@EnableTransactionManagement
@EnableJpaRepositories(
        entityManagerFactoryRef = "adminEntityManagerFactory",
        transactionManagerRef = "adminTransactionManager",
        basePackages = {"com.dong.adminserver.web.dao"}
)
@ComponentScan(basePackages = {"com.dong.commoncore.**", "com.dong.logserver.config"})
public class AdminDataSourceConfig {

    @Resource
    private JpaProperties jpaProperties;

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

    /**
     * 指定需要扫描的实体包实现与数据库关联
     *
     * @param builder
     * @return
     */
    @Primary
    @Bean(name = "adminEntityManagerFactory")
    public LocalContainerEntityManagerFactoryBean adminEntityManagerFactory(
            EntityManagerFactoryBuilder builder,
            @Qualifier("adminDataSource") DataSource dataSource) {
        return builder
                .dataSource(dataSource)
                .properties(getVendorProperties())
                .packages("com.dong.adminserver.web.entity")
                .build();
    }

    @Primary
    @Bean(name = "adminEntityManager")
    public EntityManager adminEntityManager(@Qualifier("adminEntityManagerFactory") LocalContainerEntityManagerFactoryBean localContainerEntityManagerFactoryBean) {
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
    @Bean(name = "adminTransactionManager")
    PlatformTransactionManager adminTransactionManager(@Qualifier("adminEntityManagerFactory") LocalContainerEntityManagerFactoryBean localContainerEntityManagerFactoryBean) {
        return new JpaTransactionManager(Objects.requireNonNull(localContainerEntityManagerFactoryBean.getObject()));
    }

    @Primary
    @Bean(name = "adminJdbcTemplate")
    public JdbcTemplate adminJdbcTemplate(@Qualifier("adminDataSource") DataSource dataSource) {
        return new JdbcTemplate(dataSource);
    }
}
