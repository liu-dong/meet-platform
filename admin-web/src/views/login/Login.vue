<template>
  <div class="container">
    <div class="login-wrapper">
      <h1 style="height: 20%">Web登录页面</h1>
      <div style="height: 60%">
        <el-input v-model="username" class="form-input" placeholder="请输入用户名" />
        <el-input v-model="password" class="form-input" placeholder="请输入密码" type="password" />
        <div class="kaptcha-div">
          <el-input v-model="kaptcha" placeholder="请输入验证码" />
          <el-image :src="getKaptcha" class="kaptcha-img" @click="updateKaptcha" />
        </div>
      </div>
      <div style="height: 20%">
        <el-button type="primary" @click="login">登录</el-button>
        <el-button @click.native="dialogFormVisible = true">注册</el-button>
      </div>
    </div>
    <Register
      :dialog-visible="dialogFormVisible"
      @close-dialog="closeDialog"
    />
  </div>
</template>
<script>
import { kaptchaUrl } from '@/utils/global'
import { getUserInfo, login } from '@/api/auth'
import Register from '@/views/login/component/Register'

export default {
  name: 'Login',
  components: { Register },
  data() {
    return {
      getKaptcha: '/images/kaptcha.jpg',
      getQRCode: '/images/QRCode.png',
      username: '',
      password: '',
      kaptcha: '',
      phone: '',
      email: '',
      securityCode: '', // 验证码
      dialogFormVisible: false
    }
  },
  created() {
    this.updateKaptcha()
  },
  mounted() {
  },
  methods: {
    login() {
      const data = {
        username: this.username,
        password: this.password,
        captcha: this.kaptcha
      }
      login(data).then(res => {
        if (res.code === 200) {
          this.$message.success(res.message)
          this.$store.dispatch('SET_TOKEN_INFO', res.data)
          console.log('令牌信息：', res.data)
          getUserInfo().then(res => {
            if (res.code === 200) {
              this.$message.success(res.message)
              this.$store.dispatch('SET_USER_INFO', res.data)
              console.log('用户信息：', res.data)
            }
          })
          this.$router.push({ name: 'systemHome' })
        } else {
          this.$message.error(res.message)
          this.updateKaptcha()
        }
      }).catch(() => {
        this.updateKaptcha()
      })
    },
    // 刷新验证码
    updateKaptcha() {
      const time = new Date().getTime()
      this.getKaptcha = process.env.VUE_APP_AUTH_API + kaptchaUrl + '?t=' + time
    },
    closeDialog() {
      this.dialogFormVisible = false
      this.getList()
    }
  }
}
</script>
<style scoped>
.container {
  /*border: 1px solid red;*/
  width: 100%;
  height: 97vh;
  /*居中*/
  display: flex;
  flex-flow: column;
  align-items: center;
  justify-content: center;
  /*居中*/
}

.login-wrapper {
  width: 25%;
  height: 50%;
  /*居中*/
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  /*居中*/
  box-shadow: 0 12px 24px 0 rgba(28, 31, 33, .1); /*添加阴影*/
  padding-left: 20px;
  padding-right: 20px;
}

.form-input {
  margin-bottom: 20px;
}

.kaptcha-div {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  margin-bottom: 20px;
}

.kaptcha-img {
  height: 40px;
  width: 170px;
  margin-left: 10px;
  border-radius: 3px;
  background: #b4bccc;
}

.QRCode-img {
  height: 80%;
  border-radius: 3px;
  background: #b4bccc;
}

/*手机验证码*/
.security-code-div {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  width: 100%;
  margin-bottom: 20px;
}

</style>
