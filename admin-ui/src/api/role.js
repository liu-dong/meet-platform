import axios from '@/axios/adminAxios'

export function findRoleInfoList(data, params) {
    return axios({
        url: '/roleInfo/findRoleInfoList',
        method: 'post',
        data,
        params
    })
}

export function getRoleInfo(params) {
    return axios({
        url: '/roleInfo/getRoleInfo',
        method: 'get',
        params
    })
}

export function saveRoleInfo(data) {
    return axios({
        url: '/roleInfo/saveRoleInfo',
        method: 'post',
        data
    })
}

export function deleteRoleInfo(params) {
    return axios({
        url: '/roleInfo/deleteRoleInfo',
        method: 'post',
        params
    })
}

export function findRoleAccountInfoList(data) {
    return axios({
        url: '/roleInfo/findRoleAccountInfoList',
        method: 'post',
        data
    })
}

export function findRolePermissionInfoList(data) {
    return axios({
        url: '/roleInfo/findRolePermissionInfoList',
        method: 'post',
        data
    })
}

// 分配账号
export function assignAccounts(data) {
    return axios({
        url: '/roleInfo/assignAccounts',
        method: 'post',
        data
    })
}

// 分配权限
export function assignPermissions(data) {
    return axios({
        url: '/roleInfo/assignPermissions',
        method: 'post',
        data
    })
}
