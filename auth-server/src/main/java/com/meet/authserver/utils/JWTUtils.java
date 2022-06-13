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
    public static final String APP_SECRET = "ukc8BDbRigUDaY6pZFfWus2jZWLPHO";


    /**
     * 根据用户id和昵称生成token
     *
     * @param id       用户id
     * @param nickname 用户昵称
     * @return JWT规则生成的token
     */
    public static String getJwtToken(String id, String nickname) {
        String JwtToken = Jwts.builder()
                .setHeaderParam("typ", "JWT")
                .setHeaderParam("alg", "HS256")
                .setSubject("baobao-user")
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + EXPIRE))
                .claim("id", id)
                .claim("nickname", nickname)
                // HS256算法实际上就是MD5加盐值，此时APP_SECRET就代表盐值
                .signWith(SignatureAlgorithm.HS256, APP_SECRET)
                .compact();
        return JwtToken;
    }

    /**
     * 判断token是否存在与有效
     *
     * @param jwtToken token字符串
     * @return 如果token有效返回true，否则返回false
     */
    public static boolean checkToken(String jwtToken) {
        if (StringUtils.isEmpty(jwtToken)) {
            return false;
        }
        try {
            Jwts.parser().setSigningKey(APP_SECRET).parseClaimsJws(jwtToken);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /**
     * 判断token是否存在与有效
     *
     * @param request Http请求对象
     * @return 如果token有效返回true，否则返回false
     */
    public static boolean checkToken(HttpServletRequest request) {
        try {
            // 从http请求头中获取token字符串
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
     * 根据token获取会员id
     *
     * @param request Http请求对象
     * @return 解析token后获得的用户id
     */
    public static String getMemberIdByJwtToken(HttpServletRequest request) {
        String jwtToken = request.getHeader("token");
        if (StringUtils.isEmpty(jwtToken)) {
            return "";
        }
        Jws<Claims> claimsJws = Jwts.parser().setSigningKey(APP_SECRET).parseClaimsJws(jwtToken);
        Claims claims = claimsJws.getBody();
        return (String) claims.get("id");
    }
    /**
     * 根据token获取会员id
     *
     * @param request Http请求对象
     * @return 解析token后获得的用户id
     */
    public static String getMemberIdByJwtToken(String token) {
        Jws<Claims> claimsJws = Jwts.parser().setSigningKey(APP_SECRET).parseClaimsJws(token);
        Claims claims = claimsJws.getBody();
        return (String) claims.get("id");

    }


    private static final String RSA_PRIVATE_KEY = "...";
    private static final String RSA_PUBLIC_KEY = "...";

    /**
     * 根据用户id和昵称生成token
     * @param id  用户id
     * @param nickname 用户昵称
     * @return JWT规则生成的token
     */
    public static String getJwtTokenRsa(String id, String nickname){
        // 利用hutool创建RSA
        RSA rsa = new RSA(RSA_PRIVATE_KEY, null);
        RSAPrivateKey privateKey = (RSAPrivateKey) rsa.getPrivateKey();
        String JwtToken = Jwts.builder()
                .setSubject("baobao-user")
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + EXPIRE))
                .claim("id", id)
                .claim("nickname", nickname)
                // 签名指定私钥
                .signWith(SignatureAlgorithm.RS256, privateKey)
                .compact();
        return JwtToken;
    }

    /**
     * 判断token是否存在与有效
     * @param jwtToken token字符串
     * @return 如果token有效返回true，否则返回false
     */
    public static Jws<Claims> decodeRsa(String jwtToken) {
        RSA rsa = new RSA(null, RSA_PUBLIC_KEY);
        RSAPublicKey publicKey = (RSAPublicKey) rsa.getPublicKey();
        // 验签指定公钥
        return Jwts.parser().setSigningKey(publicKey).parseClaimsJws(jwtToken);
    }

    public static void main(String[] args) {
        String token = JWTUtils.getJwtToken("liudong", "123456");
        System.out.println(token);

        String id = JWTUtils.getMemberIdByJwtToken(token);
        System.out.println(id);

    }
}
