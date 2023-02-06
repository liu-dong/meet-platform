import axios from '@/axios/authAxios'

export function findOrgInfoList(data, params) {
    return axios({
        url: '/admin-server/orgInfo/findOrgInfoList',
        method: 'post',
        data,
        params
    })
}

export function getOrgInfo(params) {
    return axios({
        url: '/admin-server/orgInfo/getOrgInfo',
        method: 'get',
        params
    })
}

export function saveOrgInfo(data) {
    return axios({
        url: '/admin-server/orgInfo/saveOrgInfo',
        method: 'post',
        data
    })
}

export function deleteOrgInfo(params) {
    return axios({
        url: '/admin-server/orgInfo/deleteOrgInfo',
        method: 'post',
        params
    })
}

export function addPerson(data) {
    return axios({
        url: '/admin-server/orgInfo/addPerson',
        method: 'post',
        data
    })
}

export function findOrgPersonInfoList(params) {
    return axios({
        url: '/admin-server/orgInfo/findOrgPersonInfoList',
        method: 'get',
        params
    })
}
