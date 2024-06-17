<template>
  <div class="app-container">
    <el-form ref="form" :model="form" :rules="rules" class="form" label-width="100px">
      <el-form-item label="用户名" prop="username">
        <el-input v-model="username" readonly/>
      </el-form-item>
      <el-form-item label="密码" prop="password">
        <el-input v-model="form.password"/>
      </el-form-item>
      <el-form-item label="确认密码" prop="confirmPassword">
        <el-input v-model="form.confirmPassword"/>
      </el-form-item>
    </el-form>
    <div class="form-button">
      <el-button type="primary" @click="saveForm('form')">保存</el-button>
      <el-button @click="goBack()">返回</el-button>
    </div>
  </div>
</template>

<script>
import { logout, updatePassword } from '@/api/auth'

export default {
  name: 'ChangePassword',
  computed: {
    username() {
      return this.$store.state.user.username
    }
  },
  data() {
    const confirmPassword = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请再次填写密码'))
      } else if (value !== this.form.password) {
        callback(new Error('两次输入密码不一致!'))
      } else {
        callback()
      }
    }
    return {
      form: {},
      rules: {
        password: [
          { required: true, message: '请填写用户密码', trigger: 'blur' }
        ],
        confirmPassword: [
          { required: true, message: '请再次填写密码', trigger: 'blur' },
          { validator: confirmPassword, trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    saveForm() { // 修改个人信息
      this.$refs['form'].validate(valid => {
        if (valid) {
          this.form.username = this.username
          updatePassword(this.form).then(res => {
            this.$message({ message: res.message, duration: 2000 })
            if (res.code === 200) {
              // 修改密码后退出登录
              this.$store.dispatch('user/logout')
            } else {
              // 处理错误情况
              this.$message.error(res.message || '失败，请稍后再试！')
            }
          })
        } else {
          return false
        }
      })
    },
    goBack() {
      this.$router.go(-1)// 返回上一层
    }
  }
}
</script>

<style lang="scss" scoped>
.form {
  width: 100%;
  height: 100%;
  display: flex;
  flex-flow: row wrap;
  justify-content: center;

  .el-form-item {
    width: 60%
  }
}
</style>
