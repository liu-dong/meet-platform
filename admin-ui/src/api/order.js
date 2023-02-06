import axios from '@/axios'

export function findOrderInfoList(data, params) {
    return axios({
        url: '/order-service/orderInfo/findOrderInfoList',
        method: 'post',
        data,
        params
    })
}

export function saveOrderInfo(data) {
    return axios({
        url: '/order-service/orderInfo/saveOrderInfo',
        method: 'post',
        data
    })
}

export function getOrderInfo(params) {
    return axios({
        url: '/order-service/orderInfo/getOrderInfo',
        method: 'get',
        params
    })
}

export function deleteOrderInfo(params) {
    return axios({
        url: '/order-service/orderInfo/deleteOrderInfo',
        method: 'post',
        params
    })
}

