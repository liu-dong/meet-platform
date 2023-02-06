import request from "@/axios/adminAxios";

// 查询数据字典目录列表
export function findDataCatalogList(data, params) {
    return request({
        url: '/dataCatalog/findDataCatalogList',
        method: 'post',
        data,
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

// 根据目录编码查询数据条目
export function getDataCatalogItem(params) {
    return request({
        url: '/dataCatalog/getDataCatalogItem',
        method: 'get',
        params
    })
}

