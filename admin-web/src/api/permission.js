import axios from '@/axios/adminAxios'

// 查找权限树
export function getPermissionTree(params) {
  return axios({
    url: '/permission/getPermissionTree',
    method: 'get',
    params
  })
}

// 查询权限列表
export function findPermissionList(data, params) {
  return axios({
    url: '/permission/findPermissionList',
    method: 'post',
    data,
    params
  })
}

export function getPermission(params) {
  return axios({
    url: '/permission/getPermission',
    method: 'get',
    params
  })
}

// 保存权限信息
export function savePermission(data) {
  return axios({
    url: '/permission/savePermission',
    method: 'post',
    data
  })
}

// 删除权限信息
export function deletePermission(params) {
  return axios({
    url: '/permission/deletePermission',
    method: 'post',
    params
  })
}

export function findParentPermissionList() {
  return axios({
    url: '/permission/findParentPermissionList',
    method: 'post'
  })
}

