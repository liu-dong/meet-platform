package com.dong.security.config.security;

import cn.hutool.core.util.ArrayUtil;
import com.dong.security.config.filter.VerificationCodeFilter;
import com.dong.security.web.service.impl.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

/**
 * 应用安全配置
 *
 * @author liudong
 */
@EnableWebSecurity
public class WebSecurityConfigurer extends WebSecurityConfigurerAdapter {

    /**
     * 不拦截的路径
     */
    private static final String[] excludePathPatterns = {"/authenticate", "/test/**", "/register", "/login", "/getKaptcha", "/session/**", "/checkToken", "/logout", "/favicon.ico", "/error"};

    /**
     * swagger路径
     */
    private static final String[] swaggerPath = {"/csrf", "/swagger-resources/**", "/webjars/**", "/v2/**", "/swagger-ui.html", "/swagger-ui.html/**"};

    @Value("${exclude.path:}")
    private String excludePath;

    @Autowired
    UserDetailsServiceImpl userDetailsService;
    @Autowired
    LoginSuccessHandler successHandler;
    @Autowired
    LoginFailureHandler failureHandler;
    @Autowired
    CustomLogoutSuccessHandler logoutSuccessHandler;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new CustomPasswordEncoder();
    }

    /**
     * 获取AuthenticationManager（认证管理器），登录时认证使用
     * 默认认证
     *
     * @param authenticationConfiguration
     * @return
     * @throws Exception
     */
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }

    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {
        String[] exclude = ArrayUtil.addAll(excludePathPatterns, swaggerPath);
        httpSecurity.cors().and().csrf().disable()// 关跨域保护
                .authorizeRequests() // 授权的请求
                .antMatchers(exclude)
                .permitAll()
                .anyRequest().authenticated(); // 其他任何请求都需要通过认证
        httpSecurity.formLogin()// 表单认证
                .loginPage("/myLogin.html")
                // 指定处理登录请求的路径
                .loginProcessingUrl("/login").permitAll()
                .successHandler(successHandler)// 自定义成功回调
                .failureHandler(failureHandler);// 自定义失败回调
        httpSecurity.logout()// 注销登录
                .logoutUrl("/logout")
                .invalidateHttpSession(true)// 清除session
                .clearAuthentication(true)// 清除认证信息
                .logoutSuccessHandler(logoutSuccessHandler);// 注销登录
        // 添加校验验证码过滤器
        httpSecurity.addFilterBefore(new VerificationCodeFilter(),
                UsernamePasswordAuthenticationFilter.class);
    }

    @Override
    public void configure(WebSecurity web) {
        web.ignoring().antMatchers("/css/**", "/js/**", "/images/**");
    }

    @Override
    protected void configure(AuthenticationManagerBuilder builder) throws Exception {
        // 基于自定义用户支持
        builder.userDetailsService(userDetailsService).passwordEncoder(new CustomPasswordEncoder());
    }
}
