<!--suppress ALL -->
<template>
    <el-form ref="loginForm" :model="loginForm" label-position="left" label-width="0px" class="login-container">
        <h2 class="title" style="padding-left:22px;">系统登录</h2>
        <el-form-item>
            <el-input type="text" v-model="loginForm.username" placeholder="账号"></el-input>
        </el-form-item>
        <el-form-item>
            <el-input type="password" v-model="loginForm.password" placeholder="密码"></el-input>
        </el-form-item>
        <el-form-item>
            <el-col :span="12">
                <el-form-item>
                    <el-input type="test" v-model="loginForm.captcha" auto-complete="off" placeholder="验证码, 单击图片刷新"
                              style="width: 100%;">
                    </el-input>
                </el-form-item>
            </el-col>
            <el-col class="line" :span="1">&nbsp;</el-col>
            <el-col :span="11">
                <el-form-item>
                    <img style="width: 100%;" class="pointer" :src="loginForm.src" @click="refreshCaptcha">
                </el-form-item>
            </el-col>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" @click="onSubmit">登录</el-button>
            <el-button type="primary" @click="onSubmit">重置</el-button>
        </el-form-item>
    </el-form>
</template>

<script>
    export default {
        name: "Login",
        data() {
            return {
                loading: false,
                loginForm: {
                    username: '',
                    password: '',
                    captcha: '',
                    src: ''
                }
            }
        },
        methods: {
            onSubmit() {
                debugger
                this.loading = true;
                let userInfo = {
                    username: this.loginForm.username, password: this.loginForm.password,
                    captcha: this.loginForm.captcha
                };
                this.$api.login.login(userInfo).then((res) => {
                    debugger
                    if (res.msg != null) {
                        this.$message({message: res.msg, type: 'error'})
                    } else {
                        this.$router.push('/')  // 登录成功，跳转到主页
                    }
                    this.loading = false
                }).catch((res) => {
                    this.$message({message: res.message, type: 'error'})
                })
            },
            refreshCaptcha: function () {
                this.loginForm.src = this.global.baseUrl + "/captcha.jpg?t=" + new Date().getTime();
            },
        },
        mounted() {
            this.refreshCaptcha()
        }
    }
</script>

<style scoped>
    .login-container {
        -webkit-border-radius: 5px;
        border-radius: 5px;
        -moz-border-radius: 5px;
        background-clip: padding-box;
        margin: 100px auto;
        width: 350px;
        padding: 35px 35px 15px 35px;
        /*形成虚影*/
        background: #fff;
        border: 1px solid #eaeaea;
        box-shadow: 0 0 25px #cac6c6;
    }

    .title {
        margin: 0px auto 30px auto;
        text-align: center;
        color: #505458;
    }
</style>
