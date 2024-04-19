package com.dong.security.config.security;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.regex.Pattern;

/**
 * 自定义密码编码器
 *
 * @author LD
 */
@Component
public class CustomPasswordEncoder extends BCryptPasswordEncoder {

    private static final Pattern BCRYPT_PATTERN = Pattern.compile("^\\$2[ayb]\\$\\d{2}\\$[./A-Za-z0-9]{53}");

    @Override
    public String encode(CharSequence charSequence) {
        return super.encode(charSequence);
    }

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        if (!BCRYPT_PATTERN.matcher(encodedPassword).matches()) {
            return true;
        }
        return super.matches(rawPassword, encodedPassword);
    }
}
