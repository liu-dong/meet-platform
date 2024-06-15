import Layout from '@/layout'
import checkRole from '@/utils/permission'

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
  // ...adminRoute,
  // ...otherRoutes

]

// 其他路由
export const otherRoutes = [
  {
    path: '/plan',
    component: Layout,
    redirect: '/plan/list',
    children: [
      {
        path: '/list',
        component: () => import('@/views/plan/list'),
        name: 'Plan',
        meta: { title: '计划制定', icon: 'table', roles: ['SuperAdmin'] }
      }
    ]
  },
  {
    path: 'external-link',
    component: Layout,
    children: [
      {
        path: 'https://panjiachen.github.io/vue-element-admin-site/#/',
        meta: { title: 'External Link', icon: 'link' }
      }
    ]
  },
  {
    path: '/401',
    component: () => import('@/views/error-page/401'),
    hidden: true
  },
  {
    path: '/404',
    component: () => import('@/views/error-page/404'),
    hidden: true
  },
  { path: '*', redirect: '/404', hidden: true }
]

/**
 * 校验路由权限
 * @param to
 * @param next
 * @returns {Promise<void>}
 */
export function checkRoutePermission(to, next) {
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

