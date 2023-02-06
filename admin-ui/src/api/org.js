import axios from '@/axios/adminAxios'

export function findOrgInfoList(data, params) {
    return axios({
        url: '/orgInfo/findOrgInfoList',
        method: 'post',
        data,
        params
    })
}

export function getOrgInfo(params) {
    return axios({
        url: '/orgInfo/getOrgInfo',
        method: 'get',
        params
    })
}

export function saveOrgInfo(data) {
    return axios({
        url: '/orgInfo/saveOrgInfo',
        method: 'post',
        data
    })
}

export function deleteOrgInfo(params) {
    return axios({
        url: '/orgInfo/deleteOrgInfo',
        method: 'post',
        params
    })
}

export function addPerson(data) {
    return axios({
        url: '/orgInfo/addPerson',
        method: 'post',
        data
    })
}

export function findOrgPersonInfoList(params) {
    return axios({
        url: '/orgInfo/findOrgPersonInfoList',
        method: 'get',
        params
    })
}
