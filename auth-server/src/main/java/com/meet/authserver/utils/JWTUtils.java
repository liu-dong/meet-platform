package com.meet.authserver.utils;

import cn.hutool.crypto.asymmetric.RSA;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author liudong 2022/6/13
 */
public class JWTUtils {

    /**
     * token时效：24小时
     */
    public static final long EXPIRE = 1000 * 60 * 60 * 24;
    /**
     * 签名哈希的密钥，对于不同的加密算法来说含义不同
     */
    public static final String APP_SECRET = "meet-platform";
    /**
     * 私钥
     */
    private static final String RSA_PRIVATE_KEY = "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";
    /**
     * 公钥
     */
    private static final String RSA_PUBLIC_KEY = "MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAtPnBH6zcvTiqM5zEbJu6SjBblZaPXEPjdjSO736Lq5gvNEFDj28I1InHsic5szBSNvBlmzkZy+5nwJsi/uFy+7FJHjaHojSDUIAPu88DNTX27pL5mXOzybTCiJDWUhFy951iuJCLD3j0yzAJeNoqRx5M/SS2GuqQX6A431yWlKYYTU9e5quh9rZPnFoHrhs5N2QLDapeSfAJIG2UUFCToVanL3ijr5u7ah5g4Sclf/cBFV3eoEKnPjLf9tyL0DCLbmw+Zb/6wqSfe2CSX2jKahQCXYpNekeagZ6QaJ4kz+hPGeKXukPiGqxFuMit/p8/Bsemnm/A1LNsyeYp54Ht0GWulu1qQ/unzIYNgFgUFPtVGynopDxooteBK6Rzr34avak8s7iWAzlDZFi8LMmBMeby4jYz+vzzk6rNEqK3+uKGrkBxlUDZBCph6AjGi+sGAwJj5f3e2X+W51k7GPtOQI1tOCEFumsmGoZQY5fI1bBVTf4j9ljlthDzDc72eOvPs5YQnVN5j4X0iyKMqA47zMhJzRxNUfaG1ASkZhvDQDbaUAQ75qnu4oVN5bR9lqzxf72PzAz8B1Z/kzb+uYVYMKqyVjlLV1tIMaszcuSm3BwIhbZDBhakL2kmtxFUwfIDYB4WQAnKOTR2FsQYg/zpQ6ELTzab4KlyLdhndDY5wnkCAwEAAQ==";


    /**
     * 生成JWT token
     *
     * @param map 自定义字段
     * @return JWT规则生成的token
     */
    public static String getJwtToken(Map<String,Object> map) {
        return Jwts.builder()
                .setHeaderParam("typ", "JWT")
                .setHeaderParam("alg", "HS256")
                .setIssuer("meet-platform")// 发行人
                .setSubject("meet")// 主题
                .setAudience("liudong")// 用户
                .setIssuedAt(new Date())// 发布时间
                .setExpiration(new Date(System.currentTimeMillis() + EXPIRE))// 到期时间
                .setNotBefore(new Date())// 在此之前不可用
                .addClaims(map)
                // HS256算法实际上就是MD5加盐值，此时APP_SECRET就代表盐值
                .signWith(SignatureAlgorithm.HS256, APP_SECRET)
                .compact();
    }

    /**
     * 校验token
     *
     * @param token
     * @return
     */
    public static boolean checkToken(String token) {
        if (StringUtils.isEmpty(token)) {
            return false;
        }
        try {
            Jwts.parser().setSigningKey(APP_SECRET).parseClaimsJws(token);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /**
     * 校验token
     *
     * @param request Http请求对象
     * @return 如果token有效返回true，否则返回false
     */
    public static boolean checkToken(HttpServletRequest request) {
        try {
            String jwtToken = request.getHeader("token");
            if (StringUtils.isEmpty(jwtToken)) {
                return false;
            }
            Jwts.parser().setSigningKey(APP_SECRET).parseClaimsJws(jwtToken);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /**
     * 获取Claims
     *
     * @param jwtToken
     * @return
     */
    public static Claims getClaims(String jwtToken) {
        if (StringUtils.isEmpty(jwtToken)) {
            return null;
        }
        Jws<Claims> claimsJws = Jwts.parser().setSigningKey(APP_SECRET).parseClaimsJws(jwtToken);
        return claimsJws.getBody();
    }

    /**
     * 获取Claims
     *
     * @param request
     * @return
     */
    public static Claims getClaims(HttpServletRequest request) {
        String jwtToken = request.getHeader("token");
        if (StringUtils.isEmpty(jwtToken)) {
            return null;
        }
        Jws<Claims> claimsJws = Jwts.parser().setSigningKey(APP_SECRET).parseClaimsJws(jwtToken);
        return claimsJws.getBody();
    }

    /**
     * 生成加密token
     *
     * @param map
     * @return
     */
    public static String getJwtTokenRsa(Map<String,Object> map){
        // 利用hutool创建RSA
        RSA rsa = new RSA();
        RSAPrivateKey privateKey = (RSAPrivateKey) rsa.getPrivateKey();
        return Jwts.builder()
                .setIssuer("meet-platform")// 发行人
                .setSubject("meet")// 主题
                .setAudience("liudong")// 用户
                .setIssuedAt(new Date())// 发布时间
                .setExpiration(new Date(System.currentTimeMillis() + EXPIRE))// 到期时间
                .setNotBefore(new Date())// 在此之前不可用
                .addClaims(map)
                // 签名指定私钥
                .signWith(SignatureAlgorithm.RS256, privateKey)
                .compact();
    }

    /**
     * 解密token
     *
     * @param jwtToken
     * @return
     */
    public static Claims decodeRsa(String jwtToken) {
        RSA rsa = new RSA();
        RSAPublicKey publicKey = (RSAPublicKey) rsa.getPublicKey();
        // 验签指定公钥
        Jws<Claims> claimsJws = Jwts.parser().setSigningKey(publicKey).parseClaimsJws(jwtToken);
        return claimsJws.getBody();
    }

    public static void main(String[] args) {
        Map<String,Object> map = new HashMap<>();
        map.put("username","liudong");
        map.put("phone","15170519059");
        String token = JWTUtils.getJwtToken(map);
        System.out.println(token);
        boolean b = JWTUtils.checkToken(token);
        System.out.println(b);
        Claims claims = JWTUtils.getClaims(token);
        System.out.println(claims);
        System.out.println("非对称加密");
        String jwtTokenRsa = JWTUtils.getJwtTokenRsa(map);
        System.out.println(jwtTokenRsa);
        Claims claimsRsa = JWTUtils.decodeRsa(jwtTokenRsa);
        System.out.println(claimsRsa);
    }
}
