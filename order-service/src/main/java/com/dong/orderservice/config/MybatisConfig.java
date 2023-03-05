package com.dong.orderservice.config;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import com.dong.orderservice.web.interceptor.MyPageInterceptor;
import com.dong.orderservice.web.interceptor.SqlCostInterceptor;
import org.apache.ibatis.plugin.Interceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author zhang.jiaxin
 * @since 2023/2/21
 */
@Configuration
public class MybatisConfig {

  @Bean
  public Interceptor interceptor() {
    return new MyPageInterceptor();
  }

//  @Bean
//  SqlCostInterceptor sqlCostInterceptor(){
//    return new SqlCostInterceptor();
//  }

//  /**
//   * mybatis-plus 低版本的分页拦截器
//   * @return
//   */
//    @Bean
//    public PaginationInterceptor paginationInterceptor() {
//      PaginationInterceptor paginationInterceptor = new PaginationInterceptor();
//      paginationInterceptor.setLimit(1000);
//      return paginationInterceptor;
//    }

  /**
   * mybatis-plus 高版本的分页拦截器
   * @return
   */
  @Bean
  public MybatisPlusInterceptor mybatisPlusInterceptor() {
    MybatisPlusInterceptor mybatisPlusInterceptor = new MybatisPlusInterceptor();
    PaginationInnerInterceptor paginationInnerInterceptor = new PaginationInnerInterceptor(DbType.MYSQL);
    paginationInnerInterceptor.setMaxLimit(100L);
    mybatisPlusInterceptor.addInnerInterceptor(paginationInnerInterceptor);
    return mybatisPlusInterceptor;
  }
}
