import axios from '@/axios/adminAxios.js'

export function findAccountInfoList(data, params) {
    return axios({
        url: '/accountInfo/findAccountInfoList',
        method: 'post',
        data,
        params
    })
}

export function getAccountInfo(params) {
    return axios({
        url: '/accountInfo/getAccountInfo',
        method: 'get',
        params
    })
}

// 保存账号信息
export function saveAccountInfo(data) {
    return axios({
        url: '/accountInfo/register',
        method: 'post',
        data
    })
}

// 注册账号
export function register(data) {
    return axios({
        url: '/accountInfo/register',
        method: 'post',
        data
    })
}

// 删除账号信息
export function deleteAccountInfo(params) {
    return axios({
        url: '/accountInfo/deleteAccountInfo',
        method: 'post',
        params
    })
}

export function findAccountRoleInfoList(data) {
    return axios({
        url: '/accountInfo/findAccountRoleInfoList',
        method: 'post',
        data
    })
}

// 分配角色
export function assignRoles(data) {
    return axios({
        url: '/accountInfo/assignRoles',
        method: 'post',
        data
    })
}

