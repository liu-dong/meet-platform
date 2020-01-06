import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import Login from '@/views/Login'

Vue.use(Router);

export default new Router({
    routes: [
        {
            path: '/',
            name: '首页',
            component: HelloWorld
        },{
            path: '/Login',
            name: '登录页面',
            component: Login
        }
    ]
})
