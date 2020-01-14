import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import Login from '@/views/Login'
import NotFound from '@/views/404'

Vue.use(Router);

export default new Router({
    routes: [
        {
            path: '/',
            name: '首页',
            component: HelloWorld
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
