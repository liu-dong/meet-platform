import axios from '@/axios/authAxios'

export function testUserInfo(params) {
    return axios({
        url: '/admin-server/logs/testUserInfo',
        method: 'get',
        params
    })
}

// 查找菜单树
export function getMenuTree(params) {
    return axios({
        url: '/admin-server/menuInfo/getMenuTree',
        method: 'get',
        params
    })
}

// 查询菜单列表
export function findMenuList(data, params) {
    return axios({
        url: '/admin-server/menuInfo/findMenuInfoList',
        method: 'post',
        data,
        params
    })
}

export function getMenuInfo(params) {
    return axios({
        url: '/admin-server/menuInfo/getMenuInfo',
        method: 'get',
        params
    })
}

// 保存菜单信息
export function saveMenuInfo(data) {
    return axios({
        url: '/admin-server/menuInfo/saveMenuInfo',
        method: 'post',
        data
    })
}

// 删除菜单信息
export function deleteMenuInfo(params) {
    return axios({
        url: '/admin-server/menuInfo/deleteMenuInfo',
        method: 'post',
        params
    })
}

export function findParentMenuInfoList(params) {
    return axios({
        url: '/admin-server/menuInfo/findParentMenuInfoList',
        method: 'post',
        params
    })
}

