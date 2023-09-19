import request from '@/axios/planAxios'

export function findPlanList(query) {
  return request({
    url: '/plan/findPlanList',
    method: 'get',
    params: query
  })
}

export function savePlan(data) {
  return request({
    url: '/plan/savePlan',
    method: 'post',
    data
  })
}

export function getPlan(id) {
  return request({
    url: '/plan/getPlan',
    method: 'get',
    params: { id }
  })
}

export function deletePlan(id) {
  return request({
    url: '/plan/deletePlan',
    method: 'post',
    params: { id }
  })
}

export function batchDeletePlan(params) {
  return request({
    url: '/plan/batchDeletePlan',
    method: 'post',
    params
  })
}

export function changePlanStatus(params) {
  return request({
    url: '/plan/changePlanStatus',
    method: 'post',
    params
  })
}

export function summary(params) {
  return request({
    url: '/plan/summary',
    method: 'post',
    params
  })
}
