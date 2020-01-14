package com.dong.meet.admin.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.annotation.Resource;
import javax.sql.DataSource;

/**
 * @author 3hld
 * @date 2020/1/14 17:41
 * @Version 1.0
 */
@Configuration
@MapperScan("com.dong.meet.**.dao")// 扫描DAO
public class MybatisConfig {

    @Resource
    private DataSource dataSource;

    /**
     * Mybatis的核心 一旦被创建,应该在应用执行期间都存在
     * @return
     * @throws Exception
     */
    @Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(dataSource);
        // 扫描Model
        sessionFactory.setTypeAliasesPackage("com.dong.meet.**.model");
        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        // 扫描映射文件
        sessionFactory.setMapperLocations(resolver.getResources("classpath*:**/mapper/*.xml"));

        return sessionFactory.getObject();
    }
}
