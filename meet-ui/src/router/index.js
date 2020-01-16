import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/views/Home'
import Login from '@/views/Login'
import NotFound from '@/views/404'

Vue.use(Router);

export default new Router({
    routes: [
        {
            path: '/',
            name: '首页',
            component: Home
        },{
            path: '/login',
            name: '登录页面',
            component: Login
        },{
            path: '/404',
            name: 'notFound',
            component: NotFound
        }
    ]
})
