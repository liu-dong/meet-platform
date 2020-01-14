package com.dong.meet.admin.service.impl;

import com.dong.meet.admin.dao.SysUserMapper;
import com.dong.meet.admin.model.SysUser;
import com.dong.meet.admin.service.LoginService;
import com.dong.meet.admin.vo.LoginInfoBean;
import com.dong.meet.common.http.HttpResult;
import com.dong.meet.common.utils.PasswordUtil;
import com.google.code.kaptcha.Constants;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @author 3hld
 * @date 2020/1/14 17:06
 * @Version 1.0
 */
@Service
public class LoginServiceImpl implements LoginService {

    @Resource
    private SysUserMapper sysUserMapper;

    /**
     * 登录方法
     *
     * @param bean
     * @param request
     * @return
     */
    @Override
    public HttpResult login(LoginInfoBean bean, HttpServletRequest request) {
        // 从session中获取之前保存的验证码跟前台传来的验证码进行匹配
        Object kaptcha = request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
        if (kaptcha == null) {
            return HttpResult.error("验证码已失效");
        }
        if (!bean.getCaptcha().equals(kaptcha)) {
            return HttpResult.error("验证码不正确");
        }
        // 用户信息
        SysUser user = sysUserMapper.getSysUserByUsername(bean.getUsername());
        // 账号不存在、密码错误
        if (user == null) {
            return HttpResult.error("账号不存在");
        }
        if (!PasswordUtil.matches(user.getSalt(), bean.getPassword(), user.getPassword())) {
            return HttpResult.error("密码不正确");
        }
        // 账号锁定
        if (user.getStatus() == 0) {
            return HttpResult.error("账号已被锁定,请联系管理员");
        }

        String token = "202001141731";
        return HttpResult.ok(token, "登录成功！");
    }
}
