import request from '@/axios/authAxios'

// 登录
export function login(data) {
    return request({
        url: '/login',
        method: 'post',
        data
    })
}

// 获取用户信息
export function getUserInfo() {
    return request({
        url: '/user/getUserDetail',
        method: 'get'
    })
}

// 登出
export function logout(data) {
    return axios({
        url: '/account/logout',
        method: 'post',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        data
    })
}

