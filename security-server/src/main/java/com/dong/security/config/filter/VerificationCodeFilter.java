package com.dong.security.config.filter;

import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.CharsetUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.dong.security.config.security.LoginFailureHandler;
import com.dong.security.exception.VerificationCodeException;
import org.apache.commons.lang3.StringUtils;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;

/**
 * 验证码过滤器
 *
 * @author LD 2021/5/28
 */
public class VerificationCodeFilter extends OncePerRequestFilter {

    private final AuthenticationFailureHandler failureHandler = new LoginFailureHandler();
    private static final String[] loginPath = {"/login","/authenticate"};

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        if (Arrays.asList(loginPath).contains(request.getRequestURI())) {
            try {
                String json = IoUtil.read(request.getInputStream(), CharsetUtil.CHARSET_UTF_8);
                JSONObject jsonObject = JSONUtil.parseObj(json);
                String requestCode = jsonObject.get("captcha").toString();
                if (!"1".equals(requestCode)) {
                    verificationCode(request);
                }
                filterChain.doFilter(request, response);

            } catch (VerificationCodeException exception) {
                failureHandler.onAuthenticationFailure(request, response, exception);
            }
        } else {
            filterChain.doFilter(request, response);

        }
    }

    public void verificationCode(HttpServletRequest request) {
        String requestCode = request.getParameter("captcha");
        HttpSession session = request.getSession();
        String savedCode = (String) session.getAttribute("KAPTCHA_SESSION_KEY");
        if (StringUtils.isNotBlank(savedCode)) {
            session.removeAttribute("KAPTCHA_SESSION_KEY");
        }
        if (StringUtils.isBlank(requestCode) || StringUtils.isBlank(savedCode) || !requestCode.equalsIgnoreCase(savedCode)) {
            throw new VerificationCodeException();
        }

    }
}
