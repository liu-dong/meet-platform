import axios from '@/axios/adminAxios'

// 查找菜单树
export function getMenuRouteTree(params) {
  return axios({
    url: '/menuRoute/getMenuRouteTree',
    method: 'get',
    params
  })
}

// 查询菜单列表
export function findMenuRouteList(params) {
  return axios({
    url: '/menuRoute/findMenuRouteList',
    method: 'get',
    params
  })
}
// 查询菜单列表
export function findMenuRouteTreeList(params) {
  return axios({
    url: '/menuRoute/findMenuRouteTreeList',
    method: 'get',
    params
  })
}

export function getMenuRoute(params) {
  return axios({
    url: '/menuRoute/getMenuRoute',
    method: 'get',
    params
  })
}

// 保存菜单信息
export function saveMenuRoute(data) {
  return axios({
    url: '/menuRoute/saveMenuRoute',
    method: 'post',
    data
  })
}

// 删除菜单信息
export function deleteMenuRoute(params) {
  return axios({
    url: '/menuRoute/deleteMenuRoute',
    method: 'post',
    params
  })
}

export function findParentMenuRouteList(params) {
  return axios({
    url: '/menuRoute/findParentMenuRouteList',
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

