package com.dong.authserver.web.service.impl;

import com.dong.authserver.web.model.LoginDTO;
import com.dong.authserver.web.model.UserDetail;
import com.dong.authserver.web.service.LoginService;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.util.JWTUtils;
import com.dong.securitycore.dao.AccountJpaDao;
import com.dong.securitycore.entity.Account;
import com.dong.securitycore.service.AccountInfoService;
import io.jsonwebtoken.Claims;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author LD 2021/5/18
 */
@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    AccountJpaDao accountJpaDao;
    @Autowired
    AccountInfoService accountInfoService;

    @Override
    public String login(LoginDTO dto) {
        String token = "";
        if (StringUtils.isNotBlank(dto.getUsername()) && StringUtils.isNotBlank(dto.getPassword())) {
            Account account = accountJpaDao.getAccountByUsername(dto.getUsername());
            if (account == null) {
                throw new GlobalException("无此用户");
            }
            if (!dto.getPassword().equals(account.getPassword())) {
                throw new GlobalException("密码错误");
            }
            //生成token
            token = JWTUtils.getToken(account.getId(), account.getUsername(), account.getRealName());
        }
        return token;
    }

    @Override
    public ResponseResult logout(String username) {
        return ResponseResult.success("退出登录成功!");
    }

    @Override
    public ResponseResult cancel(String username) {
        if (!StringUtils.isEmpty(username)) {
            Account user = accountJpaDao.getAccountByUsername(username);
            user.setUserStatus(1);//注销
            user.setUpdateTime(new Date());
            accountJpaDao.save(user);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
            return ResponseResult.success("注销成功!注销时间：" + sdf.format(new Date()));
        }
        return ResponseResult.success("用户名不能为空!");
    }

    @Override
    public UserDetail getUserDetail(HttpServletRequest request) {
        Claims claims = JWTUtils.getClaims(request);
        UserDetail user = new UserDetail();
        if (claims != null) {
            user.setUserId(String.valueOf(claims.get("userId")));
            user.setUsername(String.valueOf(claims.get("username")));
            user.setRealName(String.valueOf(claims.get("realName")));
            //查询账号角色
            List<Map<String, Object>> roles = accountInfoService.findAccountRoleInfoList(user.getUserId());
            user.setRoles(roles);
            //查询账号权限
            List<Map<String, Object>> permissions = accountInfoService.findAccountPermissionInfoList(user.getUserId());
            user.setPermissions(permissions);
        }
        return user;
    }
}
