<template>
  <el-container class="main-container">
    <el-aside width="200px" class="el-aside" style="overflow-y: auto;">
      <el-menu v-for="menu in menu" :key="menu.title" router>
        <el-submenu :index="menu.order+''">
          <template slot="title"><i class="el-icon-message" />{{ menu.title }}</template>
          <div v-for="children in menu.children" :key="children.title">
            <el-menu-item :index="children.url">{{ children.title }}</el-menu-item>
          </div>
        </el-submenu>
      </el-menu>
    </el-aside>
    <el-container>
      <el-header class="el-header">
        <div>登录时间：{{ userInfo.lastLoginTime }}</div>
        <div>
          <el-dropdown>
            <el-avatar :size="30" :src="circleUrl" fit="scale-down" style="margin-right: 15px" />
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item @click.native="dialogFormVisible = true">修改个人信息</el-dropdown-item>
              <el-dropdown-item @click.native="initPassword">重置密码</el-dropdown-item>
              <el-dropdown-item @click.native="logout">退出</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
          <el-dropdown>
            <span>{{ userInfo.username }}</span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item>用户名：{{ userInfo.username }}</el-dropdown-item>
              <el-dropdown-item>真实姓名：{{ userInfo.realName }}</el-dropdown-item>
              <el-dropdown-item>上次登录时间：{{ userInfo.lastLoginTime }}</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </div>
      </el-header>
      <el-main class="el-main">
        <router-view />
      </el-main>
    </el-container>
    <el-dialog title="用户信息" :visible.sync="dialogFormVisible" width="30%">
      <el-form ref="form" :model="form" :rules="rules" label-width="100px" class="demo-ruleForm">
        <el-form-item label="用户名" prop="username">
          <el-input v-model="form.username" />
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input v-model="form.password" />
        </el-form-item>
        <el-form-item label="真实姓名" prop="realName">
          <el-input v-model="form.realName" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer" style="text-align: center">
        <el-button type="primary" @click="updateInfo('form')">确 定</el-button>
        <el-button @click="dialogFormVisible = false">取 消</el-button>
      </div>
    </el-dialog>
  </el-container>
</template>

<script>
import qs from 'qs'
import { logout } from '@/api/auth'
import { getMenuTree } from '@/api/menu'
import { savePerson } from '@/api/person'

export default {
  name: 'Home',
  data() {
    return {
      menu: [],
      form: {}, // 个人信息表单
      userInfo: {},
      dialogFormVisible: false,
      circleUrl: 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png',
      rules: {
        username: [
          { required: true, message: '请填写用户名', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请填写用户密码', trigger: 'blur' }
        ],
        realName: [
          { required: true, message: '请填写真实姓名', trigger: 'blur' }
        ]
      }
    }
  },
  created() {
    this.initUserInfo()
    this.initMenuTree()
  },
  methods: {
    initUserInfo() { // 初始化用户信息
      const userInfo = this.$store.getters.userInfo
      console.log('systemHome', userInfo)
      const data = {
        username: 'LD',
        realName: '刘东',
        lastLoginTime: '1996年10月8日 13时14分24秒'
      }
      this.userInfo = userInfo || data
      /* let user = this.$refs.AccountDetail.getAccount(userData.id);
         console.log(user); */
    },
    initMenuTree() { // 初始化菜单树
      getMenuTree({ type: 2 }).then(res => {
        if (res.code === 200) {
          this.menu = res.data
        } else {
          this.$router.push({ name: 'error' })
        }
      })
    },
    logout: function() {
      const data = qs.stringify({
        'username': this.userInfo.username
      })
      logout(data).then(res => {
        console.log(res.data)
        this.$message({ message: res.message, duration: 2000 })
        if (res.code === 200) {
          this.$store.commit('REMOVE_TOKEN_INFO')
          this.$router.push({ name: 'login' })
        }
      })
    },
    initPassword: function() { // 重置密码成功
      alert('重置密码成功')
    },
    updateInfo: function(form) { // 修改个人信息
      this.$refs[form].validate((valid) => {
        if (valid) {
          savePerson(this.form).then(res => {
            this.$message({ message: res.message, duration: 2000 })
            if (res.code === 200) {
              this.form = res.data
            }
          })
        }
        return false
      })
      this.dialogFormVisible = false
    }
  }
}
</script>

<style scoped>

.main-container {
  /*border: 1px solid red;*/
  width: 100%;
  height: 100%;
}

.el-header {
  /*border: 1px solid red;*/
  font-size: 16px;
  background-color: #409EFF;
  color: #333;
  line-height: 60px;
  display: flex;
  justify-content: space-between;
}

.el-aside {
  /*border: 1px solid red;*/
  color: #409EFF;
  overflow: hidden;
}

.el-main {
  /*border: 1px solid red;*/
  display: block;
  flex: 1;
  flex-basis: auto;
  overflow: auto;
  box-sizing: border-box;
  padding: 10px;
}
</style>
