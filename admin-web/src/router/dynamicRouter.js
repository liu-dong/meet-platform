import { findRouteList } from '@/api/menu'
import Layout from '@/layout/index.vue'
import adminRouter from '@/router/adminRouter'

// 获取路由
export async function fetchRoutes() {
  const response = await findRouteList() // 调用API获取路由
  // 转换路由
  let routes = convertRoutes(response.data)
  console.log('路由：', routes)
  if (!routes) {
    routes = adminRouter
  }
  return routes
}

// 添加路由
function convertRoutes(routes) {
  return routes.map(route => {
    if (route.component && route.component === 'Layout') {
      debugger
      route.component = Layout
    } else {
      route.component = loadView(route.name)
      console.log(route.component)
    }
    if (route.children && route.children.length) {
      convertRoutes(route.children) // 递归处理子路由
    } else {
      route.children = []
      return route
    }
    return route
  })
}

// 加载页面
function loadView(view) {
  // return () => import(`@/views/${view}.vue`)
  return (resolve) => require([`@/views/admin/${view}`], resolve)
  // return () => import('@/views/admin/' + view + '.vue')
}
