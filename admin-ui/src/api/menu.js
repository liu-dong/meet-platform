import axios from '@/axios/adminAxios'


// 查找菜单树
export function getMenuTree(params) {
    return axios({
        url: '/menu/getMenuTree',
        method: 'get',
        params
    })
}

// 查询菜单列表
export function findMenuList(data, params) {
    return axios({
        url: '/menu/findMenuList',
        method: 'post',
        data,
        params
    })
}

export function getMenu(params) {
    return axios({
        url: '/menu/getMenu',
        method: 'get',
        params
    })
}

// 保存菜单信息
export function saveMenu(data) {
    return axios({
        url: '/menu/saveMenu',
        method: 'post',
        data
    })
}

// 删除菜单信息
export function deleteMenu(params) {
    return axios({
        url: '/menu/deleteMenu',
        method: 'post',
        params
    })
}

export function findParentMenuList(params) {
    return axios({
        url: '/menu/findParentMenuList',
        method: 'get',
        params
    })
}

