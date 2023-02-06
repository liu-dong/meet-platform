import axios from '@/axios'

// 查询数据表信息
export function findDatabasesInfoList(data) {
    return axios({
        url: '/generator-service/findDatabasesInfoList',
        method: 'post',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        data
    })
}

// 查询数据表信息
export function findTableInfoList(data) {
    return axios({
        url: '/generator-service/findTableInfoList',
        method: 'post',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        data
    })
}

// 查询数据表信息
export function batchGenerate(data) {
    return axios({
        url: '/generator-service/batchGenerate',
        method: 'post',
        data
    })
}

