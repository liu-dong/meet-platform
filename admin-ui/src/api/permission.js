import axios from '@/axios/adminAxios'

// 查找权限树
export function getPermissionTree(params) {
    return axios({
        url: '/permissionInfo/getPermissionTree',
        method: 'get',
        params
    })
}

// 查询权限列表
export function findPermissionList(data, params) {
    return axios({
        url: '/permissionInfo/findPermissionInfoList',
        method: 'post',
        data,
        params
    })
}

export function getPermissionInfo(params) {
    return axios({
        url: '/permissionInfo/getPermissionInfo',
        method: 'get',
        params
    })
}

// 保存权限信息
export function savePermissionInfo(data) {
    return axios({
        url: '/permissionInfo/savePermissionInfo',
        method: 'post',
        data
    })
}

// 删除权限信息
export function deletePermissionInfo(params) {
    return axios({
        url: '/permissionInfo/deletePermissionInfo',
        method: 'post',
        params
    })
}

export function findParentPermissionInfoList() {
    return axios({
        url: '/permissionInfo/findParentPermissionInfoList',
        method: 'post'
    })
}

