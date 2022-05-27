<template>
    <div class="container">
        <div v-show="loginWay === 1" class="login-wrapper">
            <h1 style="height: 20%">Web登录页面</h1>
            <div style="height: 60%">
                <el-input v-model="username" class="form-input" placeholder="请输入用户名"/>
                <el-input v-model="password" class="form-input" placeholder="请输入密码" type="password"/>
                <div class="kaptcha-div">
                    <el-input v-model="kaptcha" placeholder="请输入验证码"/>
                    <el-image :src="getKaptcha" class="kaptcha-img" @click="updateKaptcha"/>
                </div>
            </div>
            <div style="height: 20%">
                <el-button type="primary" @click="login">登录</el-button>
                <el-button @click.native="dialogFormVisible = true">注册</el-button>
            </div>
        </div>
        <el-dialog :visible.sync="dialogFormVisible" title="用户信息" width="30%">
            <el-form ref="form" :model="form" :rules="rules" class="demo-ruleForm" label-width="100px">
                <el-form-item label="用户名" prop="username">
                    <el-input v-model="form.username"/>
                </el-form-item>
                <el-form-item label="密码" prop="password">
                    <el-input v-model="form.password"/>
                </el-form-item>
                <el-form-item label="真实姓名" prop="realName">
                    <el-input v-model="form.realName"/>
                </el-form-item>
                <el-form-item label="身份证号" prop="identityCard">
                    <el-input v-model="form.identityCard"/>
                </el-form-item>
                <el-form-item label="用户类型" prop="userType">
                    <el-select v-model="form.userType" placeholder="请选择用户类型">
                        <el-option v-for="item in userType"
                                   :key="item.propertyCode"
                                   :label="item.propertyName"
                                   :value="item.propertyCode-0"
                        />
                    </el-select>
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer" style="text-align: center">
                <el-button type="primary" @click="register('form')">确 定</el-button>
                <el-button @click="dialogFormVisible = false">取 消</el-button>
            </div>
        </el-dialog>
    </div>
</template>
<script>
// import { getDataDic } from '@/utils/common'
import {kaptchaUrl, QRCodeUrl} from '@/utils/global'

export default {
    name: 'Login',
    data() {
        return {
            loginWay: 1,//1：账号密码、2：邮箱验证、3：扫码
            getKaptcha: '/images/kaptcha.jpg',
            getQRCode: '/images/QRCode.png',
            username: '',
            password: '',
            kaptcha: '',
            phone: '',
            email: '',
            securityCode: '', // 验证码
            rules: {
                username: [
                    {required: true, message: '请填写用户名', trigger: 'blur'}
                ],
                password: [
                    {required: true, message: '请填写用户密码', trigger: 'blur'}
                ],
                realName: [
                    {required: true, message: '请填写真实姓名', trigger: 'blur'}
                ],
                identityCard: [
                    {required: true, message: '请填写身份证号', trigger: 'blur'}
                ]
            },
            dialogFormVisible: false,
            form: {
                userType: 2
            },
            userType: []
        }
    },
    watch: {
        loginWay: function (newQuestion) {
            if (newQuestion === 1) {
                // this.updateKaptcha()
            }
        }
    },
    created() {
        const code = this.$route.query.code
        /*console.log('授权码：', code)
        if (code) {
            this.getTokenByCode(code)
        }
        this.updateKaptcha()
        ;*/
        this.autoLogin()
    },
    mounted() {
        // this.userType = getDataDic('dic:detail:admin:user.type')
    },
    methods: {
        autoLogin() {
            let data = {}
            data.username = "SuperAdmin"
            data.password = "123456"
            data.kaptcha = "1"
            /*login(data).then(res => {
                if (res.code === 200) {
                    this.$message.success(res.message)
                    this.$store.dispatch('SET_USER_INFO', res.data)
                    console.log('用户信息：', res.data)
                } else {
                    this.$message.error(res.message)
                    this.updateKaptcha()
                }
            }).catch(() => {
                this.updateKaptcha()
            })*/
            this.$router.push({name: 'billingHome'})
        },
        /*login() {
            const data = {
                username: this.username,
                password: this.password,
                kaptcha: this.kaptcha
            }
            login(data).then(res => {
                if (res.code === 200) {
                    this.$message.success(res.message)
                    this.$store.dispatch('SET_USER_INFO', res.data)
                    console.log('用户信息：', res.data)
                } else {
                    this.$message.error(res.message)
                    this.updateKaptcha()
                }
            }).catch(() => {
                this.updateKaptcha()
            })
        },*/
        /*register(form) { // 修改个人信息
            // eslint-disable-next-line consistent-return
            this.$refs[form].validate(valid => {
                if (valid) {
                    register(this.form).then(res => {
                        this.$message({message: res.message, duration: 2000})
                        if (res.code === 200) {
                            this.username = res.data.username
                            this.password = res.data.password
                        }
                    })
                } else {
                    return false
                }
            })
            this.dialogFormVisible = false
        },*/
        /*hello() {
            const data = {'s': 'This damn world!'}
            hello(data).then(res => {
                console.log(res)
            })
        },*/
        // 刷新验证码
        updateKaptcha() {
            const time = new Date().getTime()
            this.getKaptcha = process.env.VUE_APP_BASE_API + kaptchaUrl + '?t=' + time
        },
        // 刷新二维码
        updateQRCode() {
            const time = new Date().getTime()
            this.getQRCode = process.env.VUE_APP_BASE_API + QRCodeUrl + '?t=' + time
        },
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

.login-way {
    width: 27.5%;
    /*居中*/
    display: flex;
    /*居中*/
    /*box-shadow: 0 12px 24px 0 rgba(28, 31, 33, .1); !*添加阴影*!*/
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
