import axios from '@/axios/adminAxios'

export function findPersonList(params) {
  return axios({
    url: '/person/findPersonList',
    method: 'get',
    params
  })
}

export function savePerson(data) {
  return axios({
    url: '/person/savePerson',
    method: 'post',
    data
  })
}

export function getPerson(params) {
  return axios({
    url: '/person/getPerson',
    method: 'get',
    params
  })
}

export function deletePerson(id) {
  return axios({
    url: '/person/deletePerson',
    method: 'post',
    params: { id }
  })
}

