import router from '@/router'
import store from '@/store'

function logout() {
  // 清空token
  store.dispatch('REMOVE_TOKEN_INFO')
  // 清空用户信息
  store.dispatch('REMOVE_USER_INFO')
  // 跳转到登录页
  router.push({ name: 'login' })
  console.log('令牌信息：', store.getters.accessToken)
  console.log('用户信息：', store.getters.userInfo)
}

export const loginUtils = {
  logout
}
