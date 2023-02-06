import axios from '@/axios'

export function findRoleInfoList(data, params) {
    return axios({
        url: '/admin-server/roleInfo/findRoleInfoList',
        method: 'post',
        data,
        params
    })
}

export function getRoleInfo(params) {
    return axios({
        url: '/admin-server/roleInfo/getRoleInfo',
        method: 'get',
        params
    })
}

export function saveRoleInfo(data) {
    return axios({
        url: '/admin-server/roleInfo/saveRoleInfo',
        method: 'post',
        data
    })
}

export function deleteRoleInfo(params) {
    return axios({
        url: '/admin-server/roleInfo/deleteRoleInfo',
        method: 'post',
        params
    })
}

export function findRoleAccountInfoList(data) {
    return axios({
        url: '/admin-server/roleInfo/findRoleAccountInfoList',
        method: 'post',
        data
    })
}

export function findRolePermissionInfoList(data) {
    return axios({
        url: '/admin-server/roleInfo/findRolePermissionInfoList',
        method: 'post',
        data
    })
}

// 分配账号
export function assignAccounts(data) {
    return axios({
        url: '/admin-server/roleInfo/assignAccounts',
        method: 'post',
        data
    })
}

// 分配权限
export function assignPermissions(data) {
    return axios({
        url: '/admin-server/roleInfo/assignPermissions',
        method: 'post',
        data
    })
}
