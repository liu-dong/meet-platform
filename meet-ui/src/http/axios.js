/*
* 二次封装axios模块，包含拦截器等信息
*
* */
import axios from 'axios'
import config from './config'

export default function $axios(options) {
    return new Promise((resolve, reject) => {

        //导入类配置文件的信息
        const instance = axios.create({
            baseURL: config.baseUrl,// 基础url前缀
            headers: config.headers,// 请求头信息
            timeout: config.timeout,// 设置超时时间
            withCredentials: config.withCredentials// 携带凭证
        });
    })
}
