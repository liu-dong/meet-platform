package com.dong.commoncore.utils;

import com.dong.commoncore.dao.AccountJpaDao;
import com.dong.commoncore.dao.PersonJpaDao;
import com.dong.commoncore.entity.Account;
import com.dong.commoncore.entity.Person;
import com.dong.commoncore.model.UserInfoBean;
import com.netflix.client.http.HttpRequest;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;

/**
 * @author liudong 2022/2/11
 */
@Configuration
public class CurrentUserInfoUtils {

    @Autowired
    static AccountJpaDao accountJpaDao;
    @Autowired
    static PersonJpaDao personJpaDao;

    public static UserInfoBean getUserInfo(HttpServletRequest request){
        UserInfoBean bean = new UserInfoBean();
        Principal userPrincipal = request.getUserPrincipal();
        if (userPrincipal != null){
            String username = userPrincipal.getName();
            Account account = accountJpaDao.getAccountByUsername(username);
            String personId = account.getPersonId();
            Person person = personJpaDao.getOne(personId);
            BeanUtils.copyProperties(account,bean);
            BeanUtils.copyProperties(person,bean);
        }
        return bean;
    }
}
