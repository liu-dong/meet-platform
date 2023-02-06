import axios from '@/axios'

// 查找权限树
export function getPermissionTree(params) {
    return axios({
        url: '/admin-server/permissionInfo/getPermissionTree',
        method: 'get',
        params
    })
}

// 查询权限列表
export function findPermissionList(data, params) {
    return axios({
        url: '/admin-server/permissionInfo/findPermissionInfoList',
        method: 'post',
        data,
        params
    })
}

export function getPermissionInfo(params) {
    return axios({
        url: '/admin-server/permissionInfo/getPermissionInfo',
        method: 'get',
        params
    })
}

// 保存权限信息
export function savePermissionInfo(data) {
    return axios({
        url: '/admin-server/permissionInfo/savePermissionInfo',
        method: 'post',
        data
    })
}

// 删除权限信息
export function deletePermissionInfo(params) {
    return axios({
        url: '/admin-server/permissionInfo/deletePermissionInfo',
        method: 'post',
        params
    })
}

export function findParentPermissionInfoList() {
    return axios({
        url: '/admin-server/permissionInfo/findParentPermissionInfoList',
        method: 'post'
    })
}

