import Vue from 'vue'
import Router from 'vue-router'
import Layout from '@/layout'
import AdminRouter from '@/router/adminRouter'
import { findRouteList } from "@/api/menu";

Vue.use(Router)

/**
 * Note: sub-menu only appear when route children.length >= 1
 * Detail see: https://panjiachen.github.io/vue-element-admin-site/guide/essentials/router-and-nav.html
 *
 * hidden: true                   if set true, item will not show in the sidebar(default is false)
 * alwaysShow: true               if set true, will always show the root menu
 *                                if not set alwaysShow, when item has more than one children route,
 *                                it will becomes nested mode, otherwise not show the root menu
 * redirect: noRedirect           if set noRedirect will no redirect in the breadcrumb
 * name:'router-name'             the name is used by <keep-alive> (must set!!!)
 * meta : {
    roles: ['admin','editor']    control the page roles (you can set multiple roles)
    title: 'title'               the name show in sidebar and breadcrumb (recommend set)
    icon: 'svg-name'/'el-icon-x' the icon show in the sidebar
    breadcrumb: false            if set false, the item will hidden in breadcrumb(default is true)
    activeMenu: '/example/list'  if set path, the sidebar will highlight the path you set
  }
 */

/**
 * constantRoutes
 * a base page that does not have permission requirements
 * all roles can be accessed
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
  ...AdminRouter,
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
  // 404页面必须放在最后
  { path: '*', redirect: '/404', hidden: true }
]

const createRouter = () => new Router({
  mode: 'history', // require service support
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRoutes
})

const router = createRouter()

// 重置路由
export function resetRouter() {
  const newRouter = createRouter()
  router.matcher = newRouter.matcher
}

// 更新路由
export async function fetchRouter() {
  const response = await findRouteList() // 调用API获取路由
  const routes = response.data // 假设路由数据在响应的data字段中
  addRoutes(routes) // 添加路由
}

// 添加路由
function addRoutes(routes) {
  routes.forEach(route => {
    if (route.component) {
      if (route.component === 'Layout') {
        route.component = Layout
      } else {
        const path = route.component
        route.component = loadView(path)
      }
    }
    if (route.children && route.children.length) {
      addRoutes(route.children) // 递归处理子路由
    }
    router.addRoute(route) // 动态添加路由
  })
}

// 加载页面
function loadView(view) {
  return () => import(`@/views/${view}.vue`)
}

export default router
