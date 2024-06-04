import axios from '@/axios/adminAxios.js'

export function findAccountList(params) {
  return axios({
    url: '/account/findAccountList',
    method: 'get',
    params
  })
}

export function getAccount(params) {
  return axios({
    url: '/account/getAccount',
    method: 'get',
    params
  })
}

// 保存账号信息
export function saveAccount(data) {
  return axios({
    url: '/account/register',
    method: 'post',
    data
  })
}

// 注册账号
export function register(data) {
  return axios({
    url: '/account/register',
    method: 'post',
    data
  })
}

// 删除账号信息
export function deleteAccount(params) {
  return axios({
    url: '/account/deleteAccount',
    method: 'post',
    params
  })
}

export function findAccountRoleInfoList(params) {
  return axios({
    url: '/account/findAccountRoleInfoList',
    method: 'get',
    params
  })
}

// 修改账号状态
export function updateAccountStatus(params) {
  return axios({
    url: '/user/updateAccountStatus',
    method: 'post',
    params
  })
}

