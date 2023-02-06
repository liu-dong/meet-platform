import axios from '@/axios'

export function hello(params) {
    return axios({
        url: '/admin-server/accountInfo/hello',
        method: 'get',
        params
    })
}

