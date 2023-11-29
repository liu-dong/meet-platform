package com.dong.sso.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 用户信息
 *
 * @author LD 2023/10/27
 */
@Controller
public class AuthorizationController {


    /**
     * 获取用户信息
     *
     * @return
     */
    @GetMapping("/loginPage")
    public String toLoginPage() {
        return "myLogin";
    }


}
