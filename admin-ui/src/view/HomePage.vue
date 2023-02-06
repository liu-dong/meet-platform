<template>
  <div class="home-page-container">
    <transition name="el-zoom-in-center">
      <div v-if="showView" class="transition-box" @click="toPage('systemHome')">系统应用</div>
    </transition>
    <transition name="el-zoom-in-top">
      <div v-if="showView" class="transition-box" @click="toPage('shoppingHome')">购物应用</div>
    </transition>
    <transition name="el-zoom-in-bottom">
      <div v-if="showView" class="transition-box" @click="toPage('systemHome')">博客应用</div>
    </transition>
    <transition name="el-zoom-in-bottom">
      <div v-if="showView" class="transition-box" @click="toPage('generatorView')">代码生成应用</div>
    </transition>
    <transition name="el-zoom-in-bottom">
      <div v-if="showView" class="transition-box" @click="toPage('billingHome')">记账应用</div>
    </transition>
    <transition name="el-zoom-in-bottom">
      <div v-if="showView" class="transition-box" @click="logout()">退出</div>
    </transition>
    <!--        <transition name="el-zoom-in-bottom">-->
    <!--            <router-view v-if="!showView"></router-view>-->
    <!--        </transition>-->
    <router-view/>
  </div>
</template>

<script>

import {loginUtils} from '@/utils/loginUtils'

export default {
  name: 'HomePage',
  data: () => ({
    showView: true,
    userInfo: null
  }),
  created() {
    this.userInfo = this.$route.params.data
    console.log('homePage', this.userInfo)
  },
  methods: {
    toPage: function (pageName) {
      this.showView = false
      this.$router.push({name: pageName, params: {data: this.userInfo}})
    },
    logout: function () {
      loginUtils.logout()
    }
  }
}
</script>

<style>

.home-page-container {
  border: 1px solid red;
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
}

.transition-box {
  margin-bottom: 10px;
  width: 200px;
  height: 100px;
  border-radius: 4px;
  background-color: #409EFF;
  text-align: center;
  color: #fff;
  padding: 40px 20px;
  box-sizing: border-box;
  margin-right: 20px;
}
</style>
