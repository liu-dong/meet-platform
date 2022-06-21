import axios from 'axios'
import store from '@/store'
import { Message, MessageBox } from 'element-ui'

// 创建自定义axios 实例
const service = axios.create({
    baseURL: process.env.VUE_APP_AUTH_API,
    headers: {
        'Content-Type': 'application/json;charset=UTF-8'
    }, // 请求头信息
    timeout: 1000000, // 设置超时时间
    withCredentials: true// 携带凭证
})

// request 请求拦截器
service.interceptors.request.use(
    config => {
        if (store.getters.authorization) {
            config.headers.Authorization = store.getters.authorization
        }
        return config
    },
    error => {
        // do something with request error
        console.log('请求错误：', error)
        return Promise.reject(error)
    }
)

// response 响应拦截器
service.interceptors.response.use(
    response => {
        const res = response.data
        if (res.code !== 200) {
            Message({
                message: res.message || 'Error',
                type: 'error',
                duration: 5 * 1000
            })
            // 50008:非法的token; 50012:其他客户端登录了;  50014:Token 过期了
            if (res.code === 50008 || res.code === 50012 || res.code === 50014) {
                MessageBox.confirm('你已被登出，可以取消继续留在该页面，或者重新登录', '确定登出', {
                    confirmButtonText: '重新登录',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    store.dispatch('FedLogOut').then(() => {
                        location.reload()// 为了重新实例化vue-router对象 避免bug
                    })
                })
            }
            return Promise.reject(new Error(res.message || 'Error'))
        } else {
            return res
        }
    },
    error => {
        console.log('响应错误：' + error)
        Message({
            message: error.message,
            type: 'error',
            duration: 5 * 1000
        })
        return Promise.reject(error)
    }
)

export default service
