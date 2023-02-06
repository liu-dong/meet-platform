import Vue from 'vue'
import Router from 'vue-router'
import Success from '@/view/Success'
import Error from '@/view/Error'
import Login from '@/view/Login'
import adminRouter from '@/router/adminRouter'
import store from '@/store'
import Test from "@/view/Test";

Vue.use(Router)

const whiteList = ['/login', '/auth-redirect', '/test']

const router = new Router({
  mode: 'history',
  routes: [
    {path: '/', redirect: '/login'},
    {path: '/login', name: 'login', component: Login},
    {path: '/success', name: 'success', component: Success},
    {path: '/error', name: 'error', component: Error},
    {path: '/test', name: 'test', component: Test},
    ...adminRouter,
  ]
})

/* 全局前置守卫 */

router.beforeEach((to, from, next) => {
  if (store.getters.accessToken) { // 判断是否有token
    if (to.path === '/login') {
      next()
    } else if (store.getters.roles.length === 0) { // 判断当前用户是否已拉取完user_info信息
      store.dispatch('GetInfo').then(res => { // 拉取info
        const roles = res.data.role
        store.dispatch('GenerateRoutes', {roles}).then(() => { // 生成可访问的路由表
          router.addRoutes(store.getters.addRouters) // 动态添加可访问路由表
          /* hack方法 确保addRoutes已完成 ,set the replace:
             true so the navigation will not leave a history record */
          next({...to, replace: true})
        })
      }).catch(err => {
        console.log(err)
      })
    } else {
      next() // 当有用户权限的时候，说明所有可访问路由已生成 如访问没权限的全面会自动进入404页面
    }
  } else if (whiteList.indexOf(to.path) !== -1) { // 在免登录白名单，直接进入
    next()
  } else {
    next('/login') // 否则全部重定向到登录页
  }
})

export default router
