import request from '@/axios/authAxios'

// 注册账号
export function register(data) {
  return request({
    url: '/register',
    method: 'post',
    data
  })
}

// 登录
export function login(data) {
  return request({
    url: '/login',
    method: 'post',
    data
  })
}

// 获取用户信息
export function getUserDetail() {
  return request({
    url: '/user/getUserDetail',
    method: 'get'
  })
}

// 获取用户信息
export function refreshToken() {
  return request({
    url: '/refreshToken',
    method: 'get'
  })
}

// 登出
export function logout(data) {
  return request({
    url: '/logout',
    method: 'post',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    },
    data
  })
}

