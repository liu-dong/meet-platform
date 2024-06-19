
// 修改账号状态
import axios from '@/axios/fileAxios'

export function updateAccountStatus(params) {
  return axios({
    url: '/account/updateAccountStatus',
    method: 'post',
    params
  })
}
