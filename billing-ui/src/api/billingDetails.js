import request from "@/axios/billingAxios";

export function findBillingDetailsList(data, params) {
    return request({
        url: '/billing/billingDetails/findBillingList',
        method: 'post',
        data,
        params
    })
}

export function findBillingListGroup(data) {
    return request({
        url: '/billing/billingDetails/findBillingListGroup',
        method: 'post',
        data
    })
}

export function saveBillingDetails(data) {
    return request({
        url: '/billing/billingDetails/saveBillingDetails',
        method: 'post',
        data
    })
}

export function getBillingDetails(params) {
    return request({
        url: '/billing/billingDetails/getBilling',
        method: 'get',
        params
    })
}

export function deleteBillingDetails(params) {
    return request({
        url: '/billing/billingDetails/deleteBilling',
        method: 'post',
        params
    })
}

export function statisticsBillingBySpendingType(params) {
    return request({
        url: '/billing/billingDetails/statisticsBillingBySpendingType',
        method: 'get',
        params
    })
}

export function statisticsBillingByMonth(params) {
    return request({
        url: '/billing/billingDetails/statisticsBillingByMonth',
        method: 'get',
        params
    })
}

export function statisticsBilling(params) {
    return request({
        url: '/billing/billingDetails/statisticsBilling',
        method: 'get',
        params
    })
}
