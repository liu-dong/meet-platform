import Vue from 'vue'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from '@/axios'
import global from '@/util/global'
import moment from 'moment'
import qs from 'qs'
import * as echarts from 'echarts'

Vue.use(ElementUI)
Vue.prototype.$qs = qs
Vue.prototype.$axios = axios
Vue.prototype.global = global// 挂载全局配置
Vue.prototype.$moment = moment
Vue.prototype.$echarts = echarts;

Vue.config.productionTip = false

new Vue({
  store,
  router,
  render: h => h(App)
}).$mount('#app')
