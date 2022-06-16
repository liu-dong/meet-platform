import billingAxios from '@/axios/billingAxios'

export function findBillingDetailsList(data, params) {
    return billingAxios({
        url: '/billing/billingDetails/findBillingList',
        method: 'post',
        data,
        params
    })
}

export function findBillingListGroup(data) {
    return billingAxios({
        url: '/billing/billingDetails/findBillingListGroup',
        method: 'post',
        data
    })
}

export function saveBillingDetails(data) {
    return billingAxios({
        url: '/billing/billingDetails/saveBillingDetails',
        method: 'post',
        data
    })
}

export function getBillingDetails(params) {
    return billingAxios({
        url: '/billing/billingDetails/getBilling',
        method: 'get',
        params
    })
}

export function deleteBillingDetails(params) {
    return billingAxios({
        url: '/billing/billingDetails/deleteBilling',
        method: 'post',
        params
    })
}

