package com.dong.authenticationserver.security;

import com.dong.authserver.security.LoginFailureHandler;
import com.dong.authserver.security.LoginSuccessHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.web.SecurityFilterChain;

/**
 * 应用安全配置
 *
 * @author liudong
 */
@EnableWebSecurity(debug = true)
public class WebSecurityConfigurer {

    @Autowired
    LoginSuccessHandler successHandler;
    @Autowired
    LoginFailureHandler failureHandler;

    //配置安全拦截机制
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
        httpSecurity.authorizeRequests()
                .anyRequest().authenticated()
                .and().csrf().disable(); //关跨域保护; //所有请求都需要通过认证
        httpSecurity.formLogin()
                .loginPage("/myLogin.html")
                //指定处理登录请求的路径
                .loginProcessingUrl("/login")
                .permitAll()
                .successHandler(successHandler)//自定义成功回调
                .failureHandler(failureHandler);//自定义失败回调
        //添加校验验证码过滤器
//        httpSecurity.addFilterBefore(new VerificationCodeFilter(),
//                UsernamePasswordAuthenticationFilter.class);
        return httpSecurity.build();
    }


    /**
     * 配置 WebSecurity
     *
     * @return
     */
    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        return web -> web.ignoring()
                .antMatchers("/login")
                .antMatchers("/webjars/**", "/resources/**",
                        "/swagger-ui.html", "/swagger-resources/**",
                        "/v2/api-docs", "/accountInfo/register")
                .antMatchers("/index", "/successPage", "/errorPage")
                .antMatchers("index.html", "successPage.html", "errorPage.html")
                .antMatchers("/authorization/**", "/authentication/**");
    }
}
