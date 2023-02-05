import request from "@/axios/authAxios";

// 登录
export function login(data) {
    return request({
        url: '/login',
        method: 'post',
        data
    })
}

// 登录
export function getUserInfo() {
    return request({
        url: '/getUserDetail',
        method: 'get'
    })
}

