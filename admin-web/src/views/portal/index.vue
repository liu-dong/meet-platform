<template>
  <div class="home-page-container">
    <transition name="el-zoom-in-center">
      <div v-if="showView" class="transition-box" @click="toPage('http://localhost:8080/login')">后台管理系统</div>
    </transition>
    <transition name="el-zoom-in-top">
      <div v-if="showView" class="transition-box" @click="toPage()">记账系统</div>
    </transition>
    <transition name="el-zoom-in-bottom">
      <div v-if="showView" class="transition-box" @click="toPage(' http://localhost:9528/')">计划管理系统</div>
    </transition>
    <transition name="el-zoom-in-bottom">
      <div v-if="showView" class="transition-box" @click="toPage()">知识体系系统</div>
    </transition>
  </div>
</template>

<script>

export default {
  name: 'PortalPage',
  data: () => ({
    showView: true,
    userInfo: null
  }),
  created() {
    this.userInfo = this.$route.params.data
    console.log('homePage', this.userInfo)
  },
  methods: {
    toPage: function(url) {
      if (url) {
        window.open(url, '_blank')
      } else {
        alert('建设中。。。')
      }
    }
  }
}
</script>

<style>

.home-page-container {
  /*border: 1px solid red;*/
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
