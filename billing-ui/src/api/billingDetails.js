import axios from '@/axios'

export function findBillingDetailsList(data, params) {
    return axios({
        url: '/billingDetails/findBillingList',
        method: 'post',
        data,
        params
    })
}

export function saveBillingDetails(data) {
    return axios({
        url: '/billing-service/billingDetails/saveBillingDetails',
        method: 'post',
        data
    })
}

export function getBillingDetails(params) {
    return axios({
        url: '/billing-service/billingDetails/getBillingDetails',
        method: 'get',
        params
    })
}

export function deleteBillingDetails(params) {
    return axios({
        url: '/billing-service/billingDetails/deleteBillingDetails',
        method: 'post',
        params
    })
}

