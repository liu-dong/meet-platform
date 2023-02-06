import axios from '@/axios'
import authAxios from '@/axios/authAxios'

// 登录
export function login(params) {
    return axios({
        url: '/authentication-server/login',
        method: 'post',
        params
    })
}

// 密码模式获取token
export function getTokenByPassword(params) {
    return authAxios({
        url: '/authentication-server/oauth/token',
        method: 'post',
        params
    })
}

// 客户端凭据模式获取token
export function getTokenByClient(params, auth) {
    return authAxios({
        url: '/authentication-server/oauth/token',
        method: 'post',
        params,
        auth
    })
}

// 授权码模式获取token
export function getTokenByCode(params) {
    return authAxios({
        url: '/authentication-server/oauth/token',
        method: 'post',
        params
    })
}

// 隐式授权码模式获取token
export function getTokenByImplicit(params) {
    return authAxios({
        url: '/authentication-server/oauth/authorize',
        method: 'get',
        params
    })
}

// 校验token
export function checkToken(params) {
    return authAxios({
        url: '/authentication-server/oauth/check_token',
        method: 'post',
        params
    })
}

// 获取验证码
export function getSecurityCode(params) {
    return axios({
        url: '/authentication-server/authorization/getSecurityCode',
        method: 'get',
        params
    })
}

// 验证码认证
export function securityCodeAuth(params) {
    return axios({
        url: '/authentication-server/authentication/securityCodeAuth',
        method: 'get',
        params
    })
}
