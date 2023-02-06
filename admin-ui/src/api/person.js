import axios from '@/axios/adminAxios'

export function findPersonInfoList(data, params) {
    return axios({
        url: '/personInfo/findPersonInfoList',
        method: 'post',
        data,
        params
    })
}

export function savePersonInfo(data) {
    return axios({
        url: '/personInfo/savePersonInfo',
        method: 'post',
        data
    })
}

export function getPersonInfo(params) {
    return axios({
        url: '/personInfo/getPersonInfo',
        method: 'get',
        params
    })
}

export function deletePersonInfo(params) {
    return axios({
        url: '/personInfo/deletePersonInfo',
        method: 'post',
        params
    })
}

