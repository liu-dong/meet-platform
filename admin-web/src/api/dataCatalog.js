import request from '@/axios/adminAxios'

// 查询数据字典目录列表
export function findDataCatalogList(params) {
  return request({
    url: '/dataCatalog/findDataCatalogList',
    method: 'get',
    params
  })
}

// 查询数据字典条目
export function findDataCatalogItemList() {
  return request({
    url: '/dataCatalog/findDataCatalogItemList',
    method: 'get'
  })
}

// 根据目录编码查询数据字典条目
export function getDataCatalogItem(params) {
  return request({
    url: '/dataCatalog/getDataCatalogItem',
    method: 'get',
    params
  })
}

// 查询数据字典详情
export function getDataCatalogDetail(params) {
  return request({
    method: 'get',
    url: '/dataCatalog/getDataCatalogDetail',
    params
  })
}

// 保存数据字典
export function saveDataCatalog(data) {
  return request({
    method: 'post',
    url: '/dataCatalog/saveDataCatalog',
    data: data
  })
}

// 删除数据字典目录
export function deleteDataCatalog(params) {
  return request({
    method: 'post',
    url: '/dataCatalog/deleteDataCatalog',
    params
  })
}

// 删除数据字典条目
export function deleteDataCatalogItem(params) {
  return request({
    method: 'post',
    url: '/dataCatalog/deleteDataCatalogItem',
    params
  })
}

