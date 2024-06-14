import { findRouteList } from '@/api/menu'
import Layout from '@/layout/index.vue'

// 获取路由
export async function fetchRoutes() {
  const response = await findRouteList() // 调用API获取路由
  // 转换路由
  const routes = convertRoutes(response.data)
  console.log('路由：', routes)
  return routes
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
  return () => import(`@/views/${view}.vue`)
}
