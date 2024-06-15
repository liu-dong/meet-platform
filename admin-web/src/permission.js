import router, { route_404 } from './router'
import store from './store'
import { Message } from 'element-ui'
import NProgress from 'nprogress' // progress bar
import 'nprogress/nprogress.css' // progress bar style
import { getToken } from '@/utils/auth' // get token from cookie
import getPageTitle from '@/utils/get-page-title'
import checkRole from '@/utils/permission'
import { fetchRoutes } from '@/router/dynamicRouter'

NProgress.configure({ showSpinner: false }) // NProgress Configuration

const whiteList = ['/login', '/portal'] // no redirect whitelist

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
          const accessedRoutes = await fetchRoutes() // adminRouter//
          accessedRoutes.push(route_404)
          store.dispatch('GenerateRoutes', accessedRoutes).then(() => { // 存储路由
            router.addRoutes(accessedRoutes) // 动态添加可访问路由表
            next({ ...to, replace: true })
          })
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

router.afterEach(() => {
  // 结束进度条
  NProgress.done()
})

/**
 * 校验路由权限
 * @param to
 * @param next
 * @returns {Promise<void>}
 */
async function checkRoutePermission(to, next) {
  if (to.meta && to.meta.roles) {
    const checkResult = checkRole(to.meta.roles)
    if (checkResult) {
      next()
    } else {
      next({ path: '/401' })
    }
  } else {
    next()
  }
}
