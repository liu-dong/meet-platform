import axios from '@/axios'
/* 系统登录模块 */

// 登录
export function login(data) {
    return axios({
        url: '/admin-server/accountInfo/login',
        method: 'post',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        data
    })
}

// 登出
export function logout(data) {
    return axios({
        url: '/admin-server/accountInfo/logout',
        method: 'post',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        data
    })
}

