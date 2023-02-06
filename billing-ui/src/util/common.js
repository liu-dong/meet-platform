import store from '@/store'
import {getDataDictionaryInfo} from '@/api/dataDictionary'
import {checkToken} from '@/api/authorize'

/**
 * 获取分类编码数据字典
 * @param params
 * @returns {Promise<T>}
 */
export const getDataDic = (params) => getDataDictionaryInfo({categoryCode: params}).then(res => {
    if (res.code === 200) {
        const data = res.data
        if (data && data.dataType === 'string') {
            return data.categoryName
        }
        if (data && data.dataType === 'hash') {
            return data.propertyList
        }
        return data
    } else {
        return null
    }
})

/**
 * 获取分类名称
 * @param data
 * @param code
 * @returns {string}
 */
export const getCategoryName = (data, code) => {
    let result = '未设置'
    data.forEach(item => {
        if (item.propertyCode - 0 === code) {
            result = item.propertyName
        }
    })
    return result
}

/**
 * 是否授权
 */
export const isAuthorization = () => {
    let result = false
    if (store.state && store.state.accessToken) {
        checkToken({ token: store.state.accessToken }).then(res => {
            console.log('token校验：', res)
            result = true
        }).catch(error => {
            console.log('token校验：', error)
            result = false
        })
    }
    return result
}
