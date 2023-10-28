package com.dong.securitycore.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.ClientDetailsService;
import org.springframework.security.oauth2.provider.client.JdbcClientDetailsService;
import org.springframework.security.oauth2.provider.code.AuthorizationCodeServices;
import org.springframework.security.oauth2.provider.token.AuthorizationServerTokenServices;
import org.springframework.security.oauth2.provider.token.DefaultTokenServices;
import org.springframework.security.oauth2.provider.token.TokenEnhancerChain;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.Collections;


/**
 * 初始化客户端
 *
 * @author LD
 * @date 2020/10/22 0:10
 */
@Configuration
@EnableAuthorizationServer
public class AuthorizationServerConfigurer extends AuthorizationServerConfigurerAdapter {

    @Autowired
    private AuthenticationManager authenticationManager;//认证管理器（选择了密码模式时需要注入该对象）

    @Autowired
    private AuthorizationCodeServices authorizationCodeServices;//用于设置授权模式

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private TokenStore tokenStore;

    @Autowired
    private JwtAccessTokenConverter accessTokenConverter;
    @Autowired
    private ClientDetailsService clientDetailsService;
    @Resource
    DataSource dataSource;

    /**
     * 定义获取code端点和access_token端点
     *
     * @param endpoints
     * @throws Exception
     */
    @Override
    public void configure(AuthorizationServerEndpointsConfigurer endpoints) throws Exception {
        endpoints.authenticationManager(authenticationManager)
                .userDetailsService(userDetailsService)
                .authorizationCodeServices(authorizationCodeServices)
                .tokenServices(tokenService());
    }

    /**
     * 配置客户端信息
     *
     * @param clients
     * @throws Exception
     */
    @Override
    public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
        //通过数据库初始化客户端
        //配置客户端存储到db 代替原来得内存模式
        JdbcClientDetailsService clientDetailsService = new JdbcClientDetailsService(dataSource);
        clients.withClientDetails(clientDetailsService);
        //通过内存的方式初始化客户端
        /*clients.inMemory()
                .withClient("tianyalan")
                .secret("secret")
                //客户端可以使用的授权模式有五种：authorization_code(授权码模式)、implicit(隐式授权模式)
                //password(密码模式)、client_credentials(客户端凭据模式)
                .authorizedGrantTypes("password", "authorization_code", "implicit", "client_credentials", "refresh_token")
                .scopes("all")
                .redirectUris("http://www.baidu.com");//验证回调地址*/

    }

    /**
     * 配置令牌端点的安全约束
     *
     * @param security
     */
    @Override
    public void configure(AuthorizationServerSecurityConfigurer security) {
        security.allowFormAuthenticationForClients()//允许表单认证
                .tokenKeyAccess("permitAll()")//oauth/token_key是公开
                .checkTokenAccess("permitAll()");//oauth/check_token公开
    }

    //令牌管理服务
    @Bean
    public AuthorizationServerTokenServices tokenService() {
        DefaultTokenServices service = new DefaultTokenServices();
        service.setClientDetailsService(clientDetailsService);//客户端详情服务
        service.setSupportRefreshToken(true);//支持刷新令牌
        service.setTokenStore(tokenStore);//令牌存储策略
        //令牌增强
        TokenEnhancerChain tokenEnhancerChain = new TokenEnhancerChain();
        tokenEnhancerChain.setTokenEnhancers(Collections.singletonList(accessTokenConverter));
        service.setTokenEnhancer(tokenEnhancerChain);
        service.setAccessTokenValiditySeconds(7200); // 令牌默认有效期2小时
        service.setRefreshTokenValiditySeconds(259200); // 刷新令牌默认有效期3天
        return service;
    }

}
