package com.dong.shardingspheredemo.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import org.apache.shardingsphere.driver.api.ShardingSphereDataSourceFactory;
import org.apache.shardingsphere.infra.config.RuleConfiguration;
import org.apache.shardingsphere.infra.config.algorithm.ShardingSphereAlgorithmConfiguration;
import org.apache.shardingsphere.sharding.api.config.ShardingRuleConfiguration;
import org.apache.shardingsphere.sharding.api.config.rule.ShardingTableRuleConfiguration;
import org.apache.shardingsphere.sharding.api.config.strategy.sharding.StandardShardingStrategyConfiguration;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.orm.jpa.JpaProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.orm.jpa.EntityManagerFactoryBuilder;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
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
import javax.servlet.Filter;
import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.*;

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
@EnableJpaRepositories(basePackages = {"com.dong.**.dao"})
public class DruidDataSourceConfig {

    @Resource
    private DruidDataSourcePropertiesConfig properties;
    @Resource
    private JpaProperties jpaProperties;

    /**
     * druid数据源
     *
     * 表示如果存在这个Bean,则不会创建：@ConditionalOnMissingBean
     *
     * @return
     */
    @Bean(name = "dataSource")
    @ConditionalOnMissingBean
    public DataSource druidDataSource() throws SQLException {
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
        return getDataSource(druidDataSource);
    }

    private DataSource getDataSource(DruidDataSource druidDataSource) throws SQLException {
        Properties properties = new Properties();
        properties.put("sql-show", true);
        Map<String, DataSource> dataSourceMap = new HashMap<>(1);
        dataSourceMap.put("ds", druidDataSource);
        return ShardingSphereDataSourceFactory.createDataSource(dataSourceMap, createShardingRuleConfiguration(), properties);
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
        return new ShardingTableRuleConfiguration("billing_details", "ds.billing_details_$->{202103..202112},ds.billing_details_$->{202201..202210}");
    }

    /**
     * 指定需要扫描的实体包实现与数据库关联
     *
     * @param builder
     * @return
     */
    @Primary
    @Bean(name = "entityManagerFactory")
    public LocalContainerEntityManagerFactoryBean entityManagerFactory(EntityManagerFactoryBuilder builder, @Qualifier("dataSource") DataSource dataSource) {
        return builder
                .dataSource(dataSource)
                .properties(getVendorProperties())
                .packages("com.meet.**.entity")
                .build();
    }

    @Primary
    @Bean(name = "entityManager")
    public EntityManager entityManager(@Qualifier("entityManagerFactory") LocalContainerEntityManagerFactoryBean localContainerEntityManagerFactoryBean) {
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
    @Bean(name = "transactionManager")
    @Primary
    PlatformTransactionManager transactionManager(@Qualifier("entityManagerFactory") LocalContainerEntityManagerFactoryBean localContainerEntityManagerFactoryBean) {
        return new JpaTransactionManager(Objects.requireNonNull(localContainerEntityManagerFactoryBean.getObject()));
    }

    @Primary
    @Bean(name = "jdbcTemplate")
    public JdbcTemplate jdbcTemplate(@Qualifier("dataSource") DataSource dataSource) {
        return new JdbcTemplate(dataSource);
    }

    /**
     * 注册Filter信息, 监控拦截器
     * <p>
     * 相当于Web Filter配置
     *
     * @return
     */
    @Bean
    @ConditionalOnMissingBean
    public FilterRegistrationBean<Filter> filterRegistrationBean() {
        FilterRegistrationBean<Filter> filterRegistrationBean = new FilterRegistrationBean<Filter>();
        filterRegistrationBean.setFilter(new WebStatFilter());
        //拦截所有请求
        filterRegistrationBean.addUrlPatterns("/*");
        filterRegistrationBean.addInitParameter("exclusions", "*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*");
        return filterRegistrationBean;
    }

    /**
     * 配置监控服务器
     *
     * @return 返回监控注册的servlet对象
     */
    @Bean
    public ServletRegistrationBean statViewServlet() {
        ServletRegistrationBean servletRegistrationBean = new ServletRegistrationBean(new StatViewServlet(), "/druid/*");
        // 添加IP白名单
        servletRegistrationBean.addInitParameter("allow", "192.168.1.5,127.0.0.1");
        // 添加IP黑名单，当白名单和黑名单重复时，黑名单优先级更高
        servletRegistrationBean.addInitParameter("deny", "192.168.1.6");
        // 添加控制台管理用户
        servletRegistrationBean.addInitParameter("loginUsername", "druid");
        servletRegistrationBean.addInitParameter("loginPassword", "123456");
        // 是否能够重置数据
        servletRegistrationBean.addInitParameter("resetEnable", "false");
        return servletRegistrationBean;
    }

    /**
     * 配置服务过滤器
     *
     * @return 返回过滤器配置对象
     */
    @Bean
    public FilterRegistrationBean statFilter() {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean(new WebStatFilter());
        // 添加过滤规则
        filterRegistrationBean.addUrlPatterns("/*");
        // 忽略过滤格式
        filterRegistrationBean.addInitParameter("exclusions", "*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*,");
        return filterRegistrationBean;
    }
}
