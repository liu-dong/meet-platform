<template>
  <div class="login-container">
    <el-form
      ref="loginForm"
      :model="loginForm"
      :rules="loginRules"
      auto-complete="on"
      class="login-form"
      label-position="left"
    >
      <div class="title-container">
        <h3 class="title">Meet后台管理系统</h3>
      </div>
      <el-form-item prop="username">
        <span class="svg-container">
          <svg-icon icon-class="user"/>
        </span>
        <el-input
          ref="username"
          v-model="loginForm.username"
          auto-complete="on"
          name="username"
          placeholder="请输入用户名"
          tabindex="1"
          type="text"
        />
      </el-form-item>

      <el-form-item prop="password">
        <span class="svg-container">
          <svg-icon icon-class="password"/>
        </span>
        <el-input
          :key="passwordType"
          ref="password"
          v-model="loginForm.password"
          :type="passwordType"
          auto-complete="on"
          name="password"
          placeholder="请输入密码"
          tabindex="2"
          @keyup.enter.native="handleLogin"
        />
        <span class="show-pwd" @click="showPwd">
          <svg-icon :icon-class="passwordType === 'password' ? 'eye' : 'eye-open'"/>
        </span>
      </el-form-item>
      <div class="kaptcha-div">
        <span class="svg-container">
          <svg-icon icon-class="captcha"/>
        </span>
        <el-input v-model="loginForm.captcha" name="captcha" placeholder="请输入验证码" tabindex="3"/>
        <el-image :src="getKaptcha" class="kaptcha-img" @click="updateKaptcha"/>
      </div>
      <el-button
        :loading="loading"
        style="width:100%;margin-bottom:30px;"
        type="primary"
        @click.native.prevent="handleLogin"
      >登录
      </el-button>
      <div class="tips">
        <a style="margin-right:20px;" @click="showRegisterDialog">注册账号</a>
        <a @click="showResetPasswordDialog">忘记密码</a>
      </div>
    </el-form>
    <!-- 注册对话框组件，通过v-model绑定显示状态 -->
    <register :dialog-visible.sync="isRegisterDialogVisible" @close-dialog="closeRegisterDialog"/>
    <reset-password :dialog-visible.sync="isResetPasswordDialogVisible" @close-dialog="closeResetPasswordDialog"/>
  </div>
</template>

<script>
import { validUsername } from '@/utils/validate'
import Register from '@/views/login/component/Register.vue'
import ResetPassword from '@/views/login/component/ResetPassword.vue'

export default {
  name: 'Login',
  components: {
    // 注册组件
    register: Register,
    ResetPassword: ResetPassword
  },
  data() {
    const validateUsername = (rule, value, callback) => {
      if (!validUsername(value)) {
        callback(new Error('请输入正确的用户名'))
      } else {
        callback()
      }
    }
    const validatePassword = (rule, value, callback) => {
      if (value.length < 6) {
        callback(new Error('密码长度不能小于6位'))
      } else {
        callback()
      }
    }
    return {
      // 控制注册对话框的显示
      isRegisterDialogVisible: false,
      isResetPasswordDialogVisible: false,
      getKaptcha: '/images/kaptcha.jpg',
      loginForm: {
        username: '',
        password: '',
        captcha: ''
      },
      loginRules: {
        username: [{ required: true, trigger: 'blur', validator: validateUsername }],
        password: [{ required: true, trigger: 'blur', validator: validatePassword }],
        captcha: [{ required: true, trigger: 'blur', message: '请输入验证码' }]
      },
      loading: false,
      passwordType: 'password',
      redirect: undefined
    }
  },
  watch: {
    $route: {
      handler: function(route) {
        this.redirect = route.query && route.query.redirect
      },
      immediate: true
    }
  },
  created() {
    this.updateKaptcha()
  },
  methods: {
    showPwd() {
      if (this.passwordType === 'password') {
        this.passwordType = ''
      } else {
        this.passwordType = 'password'
      }
      this.$nextTick(() => {
        this.$refs.password.focus()
      })
    },
    handleLogin() {
      this.$refs.loginForm.validate(valid => {
        if (valid) {
          this.loading = true
          this.$store.dispatch('user/login', this.loginForm).then(() => {
            this.$router.push({ path: this.redirect || '/' })
            this.loading = false
          }).catch(() => {
            this.loading = false
          })
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    // 刷新验证码
    updateKaptcha() {
      const time = new Date().getTime()
      this.getKaptcha = 'http://localhost:8180/getKaptcha?t=' + time
      this.loginForm.captcha = ''
    },
    // 显示注册对话框
    showRegisterDialog() {
      this.isRegisterDialogVisible = true
    },
    // 关闭注册对话框
    closeRegisterDialog() {
      this.isRegisterDialogVisible = false
    },
    // 显示重置密码对话框
    showResetPasswordDialog() {
      this.isResetPasswordDialogVisible = true
    },
    // 关闭重置密码对话框
    closeResetPasswordDialog() {
      this.isResetPasswordDialogVisible = false
    }
  }
}
</script>

<style lang="scss">
/* 修复input 背景不协调 和光标变色 */
/* Detail see https://github.com/PanJiaChen/vue-element-admin/pull/927 */

$bg: #138196FF;
$light_gray: #fff;
$cursor: #fff;

@supports (-webkit-mask: none) and (not (cater-color: $cursor)) {
  .login-container .login-form .el-input input {
    color: $cursor;
  }
}

/* reset element-ui css */
.login-container .login-form {
  .el-input {
    display: inline-block;
    height: 47px;
    width: 85%;

    input {
      background: transparent;
      border: 0;
      -webkit-appearance: none;
      border-radius: 0;
      padding: 12px 5px 12px 15px;
      color: $light_gray;
      height: 47px;
      caret-color: $cursor;

      &:-webkit-autofill {
        box-shadow: 0 0 0 1000px $bg inset !important;
        // opacity: 0;
        -webkit-text-fill-color: $cursor !important;
      }
    }

    .el-form-item {
      border: 1px solid rgba(255, 255, 255, 0.1);
      background: rgba(0, 0, 0, 0.1);
      border-radius: 5px;
      color: #454545;
    }
  }
}
</style>

<style lang="scss" scoped>
$dark_gray: #889aa4;
$light_gray: #eee;

.login-container {
  min-height: 100%;
  width: 100%;
  background-image: url("../../assets/background_images/login.jpg");
  background-repeat: no-repeat;
  background-position: center center;
  overflow: hidden;

  .login-form {
    position: relative;
    width: 520px;
    max-width: 100%;
    padding: 160px 35px 0;
    margin: 0 auto;
    overflow: hidden;
  }

  .tips {
    font-size: 14px;
    color: #fff;
    margin-bottom: 10px;

    span {
      &:first-of-type {
        margin-right: 16px;
      }
    }
  }

  .svg-container {
    padding: 6px 5px 6px 15px;
    color: $dark_gray;
    vertical-align: middle;
    width: 30px;
    display: inline-block;
  }

  .title-container {
    position: relative;

    .title {
      font-size: 26px;
      color: $light_gray;
      margin: 0px auto 40px auto;
      text-align: center;
      font-weight: bold;
    }
  }

  .show-pwd {
    position: absolute;
    right: 10px;
    top: 7px;
    font-size: 16px;
    color: $dark_gray;
    cursor: pointer;
    user-select: none;
  }

  .kaptcha-div {
    display: flex;
    justify-content: center;
    margin-bottom: 10px;

    .el-input {
      width: 50%;
    }

    .kaptcha-img {
      margin-left: 10px;
      border-radius: 3px;
      background: #b4bccc;
    }
  }
}
</style>
