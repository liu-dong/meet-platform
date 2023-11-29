package com.dong.sso.config;

import com.dong.sso.service.UserDetailsServiceImpl;
import com.nimbusds.jose.jwk.JWKSet;
import com.nimbusds.jose.jwk.RSAKey;
import com.nimbusds.jose.jwk.source.ImmutableJWKSet;
import com.nimbusds.jose.jwk.source.JWKSource;
import com.nimbusds.jose.proc.SecurityContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Role;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.oauth2.core.AuthorizationGrantType;
import org.springframework.security.oauth2.core.ClientAuthenticationMethod;
import org.springframework.security.oauth2.core.oidc.OidcScopes;
import org.springframework.security.oauth2.jwt.JwtDecoder;
import org.springframework.security.oauth2.jwt.NimbusJwtDecoder;
import org.springframework.security.oauth2.server.authorization.client.InMemoryRegisteredClientRepository;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClient;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClientRepository;
import org.springframework.security.oauth2.server.authorization.config.annotation.web.configuration.OAuth2AuthorizationServerConfiguration;
import org.springframework.security.oauth2.server.authorization.settings.AuthorizationServerSettings;
import org.springframework.security.oauth2.server.authorization.settings.ClientSettings;
import org.springframework.security.web.SecurityFilterChain;

import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.util.UUID;

/**
 * 授权服务安全配置
 *
 * @author liudong
 */
@Configuration
@EnableWebSecurity
public class AuthorizationServerSecurityConfiguration {

    /**
     * 不拦截的路径
     */
    private static final String[] excludePathPatterns = {"/accountInfo/register", "/authenticate", "/test/**", "/register", "/login", "/getKaptcha", "/checkToken", "/logout", "/favicon.ico", "/error"};

    @Value("${exclude.path}")
    private String excludePath;

    @Autowired
    LoginSuccessHandler successHandler;
    @Autowired
    LoginFailureHandler failureHandler;
    @Autowired
    CustomLogoutSuccessHandler logoutSuccessHandler;
    @Autowired
    CustomPasswordEncoder passwordEncoder;
    @Autowired
    UserDetailsService userDetailsService;

    /**
     * 授权服务器安全过滤器链
     *
     * @param http
     * @return
     * @throws Exception
     */
    @Bean
    @Order(1)
    public SecurityFilterChain authorizationServerSecurityFilterChain(HttpSecurity http) throws Exception {
        OAuth2AuthorizationServerConfiguration.applyDefaultSecurity(http);
        return http.formLogin(Customizer.withDefaults()).build();
        /*RequestMatcher endpointsMatcher = authorizationServerConfigurer.getEndpointsMatcher();
        http
                // 拦截对 授权服务器 相关端点的请求
                .requestMatcher(endpointsMatcher)
                // 拦载到的请求需要认证确认（登录）
                .authorizeRequests()
                // 其余所有请求都要认证
                .anyRequest().authenticated()
                .and()
                // 忽略掉相关端点的csrf（跨站请求）：对授权端点的访问可以是跨站的
                .csrf(csrf -> csrf.ignoringRequestMatchers(endpointsMatcher))
                // 表单登录
                .formLogin(Customizer.withDefaults())


        return http.build();*/
    }

    /**
     * 标准安全过滤器链
     *
     * @param http
     * @return
     * @throws Exception
     */
    @Bean
    @Order(2)
    public SecurityFilterChain standardSecurityFilterChain(HttpSecurity http) throws Exception {
        http.authorizeHttpRequests((authorize) -> authorize
                        .antMatchers("/loginPage","/login").permitAll()
                        .anyRequest().authenticated()
                )
//                .formLogin(Customizer.withDefaults());
                .formLogin()
                .loginPage("/loginPage");
        return http.build();
    }

    /**
     * 配置安全拦截机制
     *
     * @param httpSecurity
     * @return
     * @throws Exception
     */
    /*@Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
        httpSecurity.cors().and().csrf().disable()//关跨域保护
                .authorizeRequests() //授权的请求
                .antMatchers(excludePathPatterns)
                .permitAll()
                .antMatchers(excludePath)
                .permitAll()
                .anyRequest().authenticated(); //其他任何请求都需要通过认证
        httpSecurity.formLogin()//表单认证
//                .loginPage("/myLogin.html")
//                .loginProcessingUrl("/login")
                .successHandler(successHandler)//自定义成功回调
                .failureHandler(failureHandler);//自定义失败回调
        httpSecurity.logout()//注销登录
                .logoutUrl("/logout")
                .invalidateHttpSession(true)//清除session
                .clearAuthentication(true)//清除认证信息
                .logoutSuccessHandler(logoutSuccessHandler);
        //添加校验验证码过滤器
        httpSecurity.addFilterBefore(new VerificationCodeFilter(),
                UsernamePasswordAuthenticationFilter.class);
        return httpSecurity.build();
    }*/
    @Bean
    public AuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(userDetailsService);
        // 可选：设置密码加密器
        provider.setPasswordEncoder(passwordEncoder);
        return provider;
    }


    /**
     * 注册客户端信息
     *
     * @return
     */
    @Bean
    public RegisteredClientRepository registeredClientRepository() {
        // @formatter:off
        RegisteredClient loginClient = RegisteredClient.withId(UUID.randomUUID().toString())
                .clientId("login-client")
                .clientSecret("{noop}openid-connect")
                .clientAuthenticationMethod(ClientAuthenticationMethod.CLIENT_SECRET_BASIC)
                .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
                .authorizationGrantType(AuthorizationGrantType.REFRESH_TOKEN)
                .redirectUri("http://127.0.0.1:8080/login/oauth2/code/login-client")
                .redirectUri("http://127.0.0.1:8080/authorized")
                .scope(OidcScopes.OPENID)
                .scope(OidcScopes.PROFILE)
                .clientSettings(ClientSettings.builder().requireAuthorizationConsent(true).build())
                .build();
        /*RegisteredClient registeredClient = RegisteredClient.withId(UUID.randomUUID().toString())
                .clientId("messaging-client")
                .clientSecret("{noop}secret")
                .clientAuthenticationMethod(ClientAuthenticationMethod.CLIENT_SECRET_BASIC)
                .authorizationGrantType(AuthorizationGrantType.CLIENT_CREDENTIALS)
                .scope("message:read")
                .scope("message:write")
                .build();*/
        RegisteredClient registeredClient = RegisteredClient.withId(UUID.randomUUID().toString())
                .clientId("messaging-client")
                .clientSecret("{noop}secret")
                .clientAuthenticationMethod(ClientAuthenticationMethod.CLIENT_SECRET_BASIC)
                .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
                .authorizationGrantType(AuthorizationGrantType.REFRESH_TOKEN)
                .authorizationGrantType(AuthorizationGrantType.CLIENT_CREDENTIALS)
                .redirectUri("http://127.0.0.1:8080/login/oauth2/code/messaging-client-oidc")
                .redirectUri("http://www.baidu.com")
                .scope(OidcScopes.OPENID)
                .scope("message.read")
                .scope("message.write")
                .clientSettings(ClientSettings.builder().requireAuthorizationConsent(true).build())
                .build();
        // @formatter:on

        return new InMemoryRegisteredClientRepository(loginClient, registeredClient);
    }

    /**
     * 配置客户端
     *
     * @param jdbcTemplate
     * @return
     */
    /*@Bean
    public RegisteredClientRepository registeredClientRepository(JdbcTemplate jdbcTemplate) {
        return new JdbcRegisteredClientRepository(jdbcTemplate);
    }*/


    /**
     * 创建包含RSA公钥和私钥的JWK（用于生成和验证JWT）
     *
     * @param keyPair
     * @return
     */
    @Bean
    public JWKSource<SecurityContext> jwkSource(KeyPair keyPair) {
        RSAPublicKey publicKey = (RSAPublicKey) keyPair.getPublic();
        RSAPrivateKey privateKey = (RSAPrivateKey) keyPair.getPrivate();
        // @formatter:off
        RSAKey rsaKey = new RSAKey.Builder(publicKey)
                .privateKey(privateKey)
                .keyID(UUID.randomUUID().toString())
                .build();
        // @formatter:on
        JWKSet jwkSet = new JWKSet(rsaKey);
        return new ImmutableJWKSet<>(jwkSet);
    }

    /**
     * 创建了一个JWT解码器(用于解码和验证JWT)
     *
     * @param keyPair
     * @return
     */
    @Bean
    public JwtDecoder jwtDecoder(KeyPair keyPair) {
        return NimbusJwtDecoder.withPublicKey((RSAPublicKey) keyPair.getPublic()).build();
    }

    @Bean
    public AuthorizationServerSettings providerSettings() {
        return AuthorizationServerSettings.builder().issuer("http://localhost:9000").build();
    }

    /**
     * 创建用户信息服务
     *
     * @return
     */
    @Bean
    public UserDetailsService userDetailsService() {
        /*// @formatter:off
        UserDetails userDetails = User.withDefaultPasswordEncoder()
                .username("user")
                .password("password")
                .roles("USER")
                .build();
        // @formatter:on*/
        return new UserDetailsServiceImpl();
    }

    /**
     * 生成RSA密钥对
     *
     * @return
     */
    @Bean
    @Role(BeanDefinition.ROLE_INFRASTRUCTURE)
    KeyPair generateRsaKey() {
        KeyPair keyPair;
        try {
            KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
            keyPairGenerator.initialize(2048);
            keyPair = keyPairGenerator.generateKeyPair();
        } catch (Exception ex) {
            throw new IllegalStateException(ex);
        }
        return keyPair;
    }

}
