import axios from '@/axios/adminAxios.js'

export function findAccountList(data, params) {
    return axios({
        url: '/account/findAccountList',
        method: 'post',
        data,
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

export function findAccountRoleInfoList(data) {
    return axios({
        url: '/account/findAccountRoleInfoList',
        method: 'post',
        data
    })
}

// 分配角色
export function assignRoles(data) {
    return axios({
        url: '/account/assignRoles',
        method: 'post',
        data
    })
}

