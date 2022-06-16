import axios from '@/axios'

// 登录
export function login(data) {
    return axios({
        url: '/login',
        method: 'post',
        headers: {
            'Content-Type': 'application/json;charset=UTF-8'
        },
        data
    })
}

// 登出
export function logout(data) {
    return axios({
        url: '/logout',
        method: 'post',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        data
    })
}

