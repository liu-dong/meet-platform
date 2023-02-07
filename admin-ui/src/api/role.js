import axios from '@/axios/adminAxios'

export function findRoleInfoList(data, params) {
    return axios({
        url: '/role/findRoleList',
        method: 'post',
        data,
        params
    })
}

export function getRoleInfo(params) {
    return axios({
        url: '/role/getRoleDetail',
        method: 'get',
        params
    })
}

export function saveRoleInfo(data) {
    return axios({
        url: '/role/saveRole',
        method: 'post',
        data
    })
}

export function deleteRoleInfo(params) {
    return axios({
        url: '/role/deleteRole',
        method: 'post',
        params
    })
}

export function findRoleAccountInfoList(data) {
    return axios({
        url: '/role/findRoleAccountList',
        method: 'post',
        data
    })
}

export function findRolePermissionInfoList(data) {
    return axios({
        url: '/role/findRolePermissionList',
        method: 'post',
        data
    })
}

// 分配账号
export function assignAccounts(data) {
    return axios({
        url: '/role/assignAccounts',
        method: 'post',
        data
    })
}

// 分配权限
export function assignPermissions(data) {
    return axios({
        url: '/role/assignPermissions',
        method: 'post',
        data
    })
}
