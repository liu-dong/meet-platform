import { findRouteList } from '@/api/menu'
import Layout from '@/layout/index.vue'

// 获取路由
export async function fetchRoutes() {
  const response = await findRouteList() // 调用API获取路由
  const routes = response.data // 假设路由数据在响应的data字段中
  debugger
  return convertRoutes(routes) // 转换路由
}

// 添加路由
function convertRoutes(routes) {
  return routes.map(route => {
    if (route.component && route.component === 'Layout') {
      route.component = Layout
    } else {
      route.component = loadView(route.name)
    }
    if (route.children && route.children.length) {
      convertRoutes(route.children) // 递归处理子路由
    } else {
      return route
    }
    return route
  })
}

// 加载页面
function loadView(view) {
  debugger
  return () => import(`@/views/${view}.vue`)
}
