package com.dong.security.config;

import com.dong.security.filter.VerificationCodeFilter;
import com.dong.security.interceptor.AuthenticationInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 应用安全配置
 *
 * @author liudong
 */
@EnableWebSecurity(debug = true)
public class WebSecurityConfigurer implements WebMvcConfigurer {

    /**
     * 不拦截的路径
     */
    private static final String[] excludePathPatterns = {"/test/**", "/register", "/login", "/getKaptcha", "/checkToken", "/logout", "/favicon.ico", "/error"};

    /**
     * swagger路径
     */
    private static final String[] swaggerPath = {"/csrf", "/swagger-resources/**", "/webjars/**", "/v2/**", "/swagger-ui.html", "/swagger-ui.html/**"};

    @Value("${exclude.path}")
    private String excludePath;

    @Autowired
    LoginSuccessHandler successHandler;
    @Autowired
    LoginFailureHandler failureHandler;

    //配置安全拦截机制
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
        httpSecurity.cors().and().csrf().disable()//关跨域保护
                .authorizeRequests() //授权的请求
                .antMatchers("/login", "/security/login", "/accountInfo/register")
                .permitAll()
                .anyRequest().authenticated(); //其他任何请求都需要通过认证
        httpSecurity.formLogin()//表单认证
                //指定处理登录请求的路径
                .loginProcessingUrl("/login")
//                .permitAll()
                .successHandler(successHandler)//自定义成功回调
                .failureHandler(failureHandler);//自定义失败回调
        //添加校验验证码过滤器
        httpSecurity.addFilterBefore(new VerificationCodeFilter(),
                UsernamePasswordAuthenticationFilter.class);
        return httpSecurity.build();
    }


    /**
     * 配置 WebSecurity(主要用于忽略静态资源)
     *
     * @return
     */
    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        return web -> web.ignoring()
                .antMatchers("/css/**", "/js/**", "/images/**");
    }

    @Bean
    public HandlerInterceptor authenticationInterceptor() {
        return new AuthenticationInterceptor();
    }


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(authenticationInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns(swaggerPath)
                .excludePathPatterns(excludePathPatterns)
                .excludePathPatterns(excludePath.split(","));
    }
}
