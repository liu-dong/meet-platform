package com.meet.authserver.web.service.impl;

import com.meet.authserver.utils.JWTUtils;
import com.meet.authserver.web.dao.AccountJpaDao;
import com.meet.authserver.web.entity.Account;
import com.meet.authserver.web.model.LoginDTO;
import com.meet.authserver.web.service.LoginService;
import com.meet.commoncore.model.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author LD 2021/5/18
 */
@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    AccountJpaDao accountJpaDao;

    @Override
    public String login(LoginDTO dto) {
        String token = "";
        if (!StringUtils.isEmpty(dto.getUsername()) && !StringUtils.isEmpty(dto.getPassword())) {
            Account account = accountJpaDao.getAccountByUsername(dto.getUsername());
            if (dto.getPassword().equals(account.getPassword())) {
                //生成token
                token = JWTUtils.getToken(account.getId(), account.getUsername(), account.getRealName());
            }
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
}
