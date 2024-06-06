import { findRouteList } from '@/api/menu'
import Layout from '@/layout/index.vue'
import router from '@/router/index'

// 获取路由
export async function fetchRoutes() {
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
