import axios from '@/axios/adminAxios'

export function findOrgList(params) {
  return axios({
    url: '/org/findOrgList',
    method: 'get',
    params
  })
}

export function getOrg(params) {
  return axios({
    url: '/org/getOrg',
    method: 'get',
    params
  })
}

export function saveOrg(data) {
  return axios({
    url: '/org/saveOrg',
    method: 'post',
    data
  })
}

export function deleteOrg(params) {
  return axios({
    url: '/org/deleteOrg',
    method: 'post',
    params
  })
}

export function addPerson(data) {
  return axios({
    url: '/org/addPerson',
    method: 'post',
    data
  })
}

export function findOrgPersonList(params) {
  return axios({
    url: '/org/findOrgPersonList',
    method: 'get',
    params
  })
}
