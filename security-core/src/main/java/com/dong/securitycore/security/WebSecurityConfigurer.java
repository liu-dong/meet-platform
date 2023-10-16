package com.dong.securitycore.security;

import com.dong.securitycore.VerificationCodeFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

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
        httpSecurity.cors().and().csrf().disable()//关跨域保护
                .authorizeRequests() //授权的请求
                .antMatchers("/login").permitAll()
                .anyRequest().authenticated(); //其他任何请求都需要通过认证
        httpSecurity.formLogin()//表单认证
//                .loginPage("/myLogin.html")
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
     * 配置 WebSecurity
     *
     * @return
     */
    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        return web -> web.ignoring()
                .antMatchers("/security/login", "/accountInfo/register")
                .antMatchers("/index", "/successPage", "/errorPage")
                .antMatchers("index.html", "successPage.html", "errorPage.html")
                .antMatchers("/authorization/**", "/authentication/**");
    }
}
