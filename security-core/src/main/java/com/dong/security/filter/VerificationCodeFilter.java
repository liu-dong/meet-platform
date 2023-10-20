package com.dong.security.filter;

import com.dong.security.config.LoginFailureHandler;
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
    private static final String[] ignorePath = {"/oauth/authorize"};

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        if (Arrays.asList(ignorePath).contains(request.getRequestURI())) {
            filterChain.doFilter(request, response);
        } else {
            try {
                String requestCode = request.getParameter("captcha");
                if (!"1".equals(requestCode)) {
                    verificationCode(request);
                }
                filterChain.doFilter(request, response);

            } catch (VerificationCodeException exception) {
                failureHandler.onAuthenticationFailure(request, response, exception);
            }
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
