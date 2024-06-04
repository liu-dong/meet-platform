import axios from '@/axios/adminAxios.js'

export function findUserList(params) {
  return axios({
    url: '/user/findUserList',
    method: 'get',
    params
  })
}

export function getUser(params) {
  return axios({
    url: '/user/getUser',
    method: 'get',
    params
  })
}

// 删除用户信息
export function deleteUser(params) {
  return axios({
    url: '/user/deleteUser',
    method: 'post',
    params
  })
}

// 查询用户已有角色
export function findUserRoleList(params) {
  return axios({
    url: '/user/findUserRoleList',
    method: 'get',
    params
  })
}

// 分配角色
export function assignRoles(data) {
  return axios({
    url: '/user/assignRoles',
    method: 'post',
    data
  })
}
