import axios from '@/axios'

export function findProductInfoList(data, params) {
    return axios({
        url: '/product-service/productInfo/findProductInfoList',
        method: 'post',
        data,
        params
    })
}

export function getProductInfo(params) {
    return axios({
        url: '/product-service/productInfo/getProductInfo',
        method: 'get',
        params
    })
}

export function saveProductInfo(data) {
    return axios({
        url: '/product-service/productInfo/saveProductInfo',
        method: 'post',
        data
    })
}

