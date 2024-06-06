import axios from '@/axios/adminAxios'

// 查找菜单树
export function getMenuTree(params) {
  return axios({
    url: '/menuRoute/getMenuTree',
    method: 'get',
    params
  })
}

// 查询菜单列表
export function findMenuList(params) {
  return axios({
    url: '/menuRoute/findMenuList',
    method: 'get',
    params
  })
}

export function getMenu(params) {
  return axios({
    url: '/menuRoute/getMenu',
    method: 'get',
    params
  })
}

// 保存菜单信息
export function saveMenu(data) {
  return axios({
    url: '/menuRoute/saveMenu',
    method: 'post',
    data
  })
}

// 删除菜单信息
export function deleteMenu(params) {
  return axios({
    url: '/menuRoute/deleteMenu',
    method: 'post',
    params
  })
}

export function findParentMenuList(params) {
  return axios({
    url: '/menuRoute/findParentMenuList',
    method: 'get',
    params
  })
}

export function findRouteList(params) {
  return axios({
    url: '/menuRoute/findRouteList',
    method: 'get',
    params
  })
}

