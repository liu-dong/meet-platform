import Vue from 'vue'
import Router from 'vue-router'
import NProgress from 'nprogress'
import getPageTitle from '@/utils/get-page-title'
import { getToken } from '@/utils/auth'
import store from '@/store'
import { fetchRoutes } from '@/router/dynamicRoute'
import { checkRoutePermission, constantRoutes, otherRoutes } from '@/router/route'
import { Message } from 'element-ui'

Vue.use(Router)

const createRouter = () => {
  return new Router({
    mode: 'history', // 需要服务支持
    scrollBehavior: () => ({ y: 0 }),
    routes: constantRoutes
  })
}

// 创建路由
const router = createRouter()

// 白名单
const whiteList = ['/login', '/portal']

// 进度条配置
NProgress.configure({ showSpinner: false }) // NProgress Configuration

// 前置路由
router.beforeEach(async(to, from, next) => {
  // 开始进度条
  NProgress.start()
  document.title = getPageTitle(to.meta.title)
  const hasToken = getToken()
  if (hasToken) {
    if (to.path === '/login') {
      // 如果已经登录，跳转到首页
      next({ path: '/home' })
      NProgress.done()
    } else {
      const hasGetUserInfo = store.getters.nickname
      if (!hasGetUserInfo) {
        try {
          // get user info
          await store.dispatch('user/getInfo')
          // 基于用户角色，动态获取并加载路由
          const accessedRoutes = await fetchRoutes()
          accessedRoutes.push(...otherRoutes)
          // 存储路由
          store.dispatch('GenerateRoutes', accessedRoutes).then(() => {
            // 动态添加可访问路由表
            router.addRoutes(accessedRoutes)
            next({ ...to, replace: true })
          })
          // 添加侧边栏路由
          await store.dispatch('SetSidebarRouters', accessedRoutes)
          // hack方法，确保addRoutes已完成
          next({ ...to, replace: true })
        } catch (error) {
          // 移除token,重新登录
          await store.dispatch('user/resetToken')
          Message.error(error || '遇到错误，请重新登录')
          next(`/login?redirect=${to.path}`)
          NProgress.done()
        }
      }
      await checkRoutePermission(to, next)
    }
  } else {
    /* has no token*/
    if (whiteList.indexOf(to.path) !== -1) {
      next()
    } else {
      next(`/login`)
      NProgress.done()
    }
  }
})

// 后置路由
router.afterEach(() => {
  // 结束进度条
  NProgress.done()
})

// 重置路由
export function resetRouter() {
  const newRouter = createRouter()
  router.matcher = newRouter.matcher
}

export default router
