import axios from '@/axios'

export function findProvinceList() {
  return axios({
    url: '/common-service/division/findProvinceList',
    method: 'post'
  })
}

export function findSubordinateDivisionList(params) {
  return axios({
    url: '/common-service/division/findSubordinateDivisionList',
    method: 'post',
    params
  })
}
