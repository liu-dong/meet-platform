import Vue from 'vue'
import Router from 'vue-router'
import Layout from '@/layout'
// import AdminRouter from '@/router/adminRouter'

Vue.use(Router)

/**
 * 注意: 当路由的子路由数量至少为1时，子菜单才会显示
 * 具体详情参考: https://panjiachen.github.io/vue-element-admin-site/guide/essentials/router-and-nav.html
 *
 * hidden: true                   如果设置为true，该项将不会在侧边栏中显示(默认是false)
 * alwaysShow: true               如果设置为true，将始终显示根菜单
 *                                如果没有设置alwaysShow且子路由数量超过一个时，
 *                                它会变成嵌套模式，否则不显示根菜单
 * redirect: noRedirect           如果设置了noRedirect，则在面包屑中不会重定向
 * name:'router-name'             名称由<keep-alive>使用(必须设置!!!)
 * meta : {
 roles: ['admin','editor']    控制页面角色(你可以设置多个角色)
 title: 'title'               显示在侧边栏和面包屑中的名称(推荐设置)
 icon: 'svg-name'/'el-icon-x' 在侧边栏中显示的图标
 breadcrumb: false            如果设置为false，该项将隐藏在面包屑中(默认是true)
 activeMenu: '/example/list'  如果设置了路径，侧边栏将高亮你设置的路径
 }
 */

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
  },
  // ...AdminRouter,
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
  }
]

export const route_404 = { path: '*', redirect: '/404', hidden: true }

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
