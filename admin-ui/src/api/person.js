import axios from '@/axios/authAxios'

export function findPersonInfoList(data, params) {
    return axios({
        url: '/admin-server/personInfo/findPersonInfoList',
        method: 'post',
        data,
        params
    })
}

export function savePersonInfo(data) {
    return axios({
        url: '/admin-server/personInfo/savePersonInfo',
        method: 'post',
        data
    })
}

export function getPersonInfo(params) {
    return axios({
        url: '/admin-server/personInfo/getPersonInfo',
        method: 'get',
        params
    })
}

export function deletePersonInfo(params) {
    return axios({
        url: '/admin-server/personInfo/deletePersonInfo',
        method: 'post',
        params
    })
}

