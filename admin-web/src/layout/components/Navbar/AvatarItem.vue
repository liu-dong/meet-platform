<template>
  <el-dropdown class="avatar-container" trigger="click">
    <div class="avatar-wrapper">
      <img :src="avatar+'?imageView2/1/w/80/h/80'" class="user-avatar" alt="头像">
      <i class="el-icon-caret-bottom" />
    </div>
    <el-dropdown-menu slot="dropdown" class="user-dropdown">
      <router-link to="/">
        <el-dropdown-item>
          首页
        </el-dropdown-item>
      </router-link>
      <a target="_blank" href="https://github.com/PanJiaChen/vue-admin-template/">
        <el-dropdown-item>Github</el-dropdown-item>
      </a>
      <a target="_blank" href="https://panjiachen.github.io/vue-element-admin-site/#/">
        <el-dropdown-item>Docs</el-dropdown-item>
      </a>
      <el-dropdown-item divided @click.native="logout">
        <span style="display:block;">退出</span>
      </el-dropdown-item>
    </el-dropdown-menu>
  </el-dropdown>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  computed: {
    ...mapGetters([
      'avatar'
    ])
  },
  methods: {
    async logout() {
      await this.$store.dispatch('user/logout')
      this.$router.push(`/login?redirect=${this.$route.fullPath}`)
    }
  }
}
</script>

<style lang="scss" scoped>
.avatar-container {
  margin-right: 30px;

  .avatar-wrapper {
    margin-top: 5px;
    position: relative;

    .user-avatar {
      cursor: pointer;
      width: 40px;
      height: 40px;
      border-radius: 10px;
    }

    .el-icon-caret-bottom {
      cursor: pointer;
      position: absolute;
      right: -20px;
      top: 25px;
      font-size: 12px;
    }
  }
}
</style>
