import Vue from 'vue'
import Router from 'vue-router'
import Layout from '@/layout'
// import AdminRouter from '@/router/adminRouter'

Vue.use(Router)

/**
 * constantRoutes
 * 一个不需要权限要求的基本页面
 * 所有角色都可以访问
 */
export const constantRoutes = [
  {
    path: '/portal',
    component: () => import('@/views/portal/index'),
    hidden: true
  },
  {
    path: '/login',
    component: () => import('@/views/login/index'),
    hidden: true
  },
  {
    path: '/',
    component: Layout,
    redirect: '/home',
    children: [
      {
        path: '/home',
        name: 'Home',
        component: () => import('@/views/home/index'),
        meta: { title: '首页', icon: 'dashboard' }
      }
    ]
  }
  // ...AdminRouter
]

const createRouter = () => new Router({
  mode: 'history', // 需要服务支持
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRoutes
})

const router = createRouter()

// 重置路由
export function resetRouter() {
  const newRouter = createRouter()
  router.matcher = newRouter.matcher
}

export default router
