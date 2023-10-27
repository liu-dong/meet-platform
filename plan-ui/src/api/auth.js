import request from '@/axios/authAxios'

// 登录
export function login(params) {
  return request({
    url: '/authenticate',
    method: 'post',
    params
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
export function logout() {
  return request({
    url: '/logout',
    method: 'get'
  })
}

