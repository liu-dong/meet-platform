import axios from '@/axios'

export function findDataDictionaryList(data) {
    return axios({
        url: '/common-service/findDataDictionaryList',
        method: 'post',
        data
    })
}

// 添加Redis数据
export function saveRedisData(data) {
    return axios({
        url: '/common-service/saveRedisData',
        method: 'post',
        data
    })
}

// 添加数据字典
export function saveDataDictionary(data) {
    return axios({
        url: '/common-service/saveDataDictionary',
        method: 'post',
        data
    })
}

export function getDataDictionaryInfo(params) {
    return axios({
        url: '/common-service/getDataDictionaryInfo',
        method: 'get',
        params
    })
}

// 删除菜单信息
export function deleteDataDictionaryInfo(params) {
    return axios({
        url: '/common-service/deleteDataDictionaryInfo',
        method: 'get',
        params
    })
}

