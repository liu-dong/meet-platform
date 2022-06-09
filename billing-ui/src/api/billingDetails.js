import axios from '@/axios'

export function findBillingDetailsList(data, params) {
    return axios({
        url: '/billing/billingDetails/findBillingList',
        method: 'post',
        data,
        params
    })
}

export function findBillingListGroup(data) {
    return axios({
        url: '/billing/billingDetails/findBillingListGroup',
        method: 'post',
        data
    })
}

export function saveBillingDetails(data) {
    return axios({
        url: '/billing/billingDetails/saveBillingDetails',
        method: 'post',
        data
    })
}

export function getBillingDetails(params) {
    return axios({
        url: '/billing/billingDetails/getBilling',
        method: 'get',
        params
    })
}

export function deleteBillingDetails(params) {
    return axios({
        url: '/billing/billingDetails/deleteBilling',
        method: 'post',
        params
    })
}

