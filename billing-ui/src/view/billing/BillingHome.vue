<template>
  <el-container style="height: 100%;">
    <el-header style="height: 10%;display: flex;">
      <h1 style="margin-right: 20px;">个人记账系统</h1>
      <el-menu :router="true" style="height: 100%" background-color="#66B1FF" text-color="#303133" :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect">
        <el-menu-item index="/billingDetailsGroup">首页</el-menu-item>
        <el-submenu index="2">
          <template slot="title">统计</template>
          <el-menu-item index="/monthStatistics">月度统计</el-menu-item>
          <el-menu-item index="2-2">年度各月统计</el-menu-item>
          <el-menu-item index="/yearStatistics">年度统计</el-menu-item>
        </el-submenu>
        <el-menu-item index="/billingDetailsList">账单列表</el-menu-item>
      </el-menu>
    </el-header>
    <el-main style="display: flex;justify-content: center;">
      <router-view></router-view>
    </el-main>
  </el-container>
</template>

<script>

export default {
  name: "BillingHome",
  data() {
    return {
      activeIndex: '1',
      billingDetailsList: []
    }
  },
  created() {
    this.$router.push({name: "billingDetailsGroup"})
  },
  methods: {
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
    }
  }
}
</script>

<style scoped>
.el-header {
  background-color: #66B1FF;
  color: #333;
}

.el-main {
  background-color: #D9ECFF;
  color: #333;
}
</style>
