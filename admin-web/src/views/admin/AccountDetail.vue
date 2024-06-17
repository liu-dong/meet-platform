<template>
  <div class="app-container">
    <el-form ref="ruleForm" :model="ruleForm" :rules="rules" class="form" label-width="100px">
      <el-form-item label="用户名" prop="username">
        <el-input v-model="ruleForm.username"/>
      </el-form-item>
      <el-form-item label="账号状态" prop="accountStatus">
        <el-select v-model="ruleForm.accountStatus" placeholder="请选择账号状态">
          <el-option
            v-for="item in accountStatusOption"
            :key="item.itemCode"
            :label="item.itemName"
            :value="item.itemCode-0"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="密码" prop="password">
        <el-input v-model="ruleForm.password"/>
      </el-form-item>
      <el-form-item label="加密密码" prop="passwordHash">
        <el-input v-model="ruleForm.passwordHash"/>
      </el-form-item>
      <el-form-item label="手机号" prop="phone">
        <el-input v-model="ruleForm.phone"/>
      </el-form-item>
      <el-form-item label="邮箱" prop="email">
        <el-input v-model="ruleForm.email"/>
      </el-form-item>
      <el-form-item label="登录次数" prop="loginCount">
        <el-input v-model="ruleForm.loginCount"/>
      </el-form-item>
      <el-form-item label="上次登录时间" prop="lastLoginTime">
        <el-input v-model="ruleForm.lastLoginTime"/>
      </el-form-item>
    </el-form>
    <div class="form-button">
      <el-button type="primary" @click="saveForm('ruleForm')">保存</el-button>
      <el-button @click="goBack()">返回</el-button>
    </div>
  </div>
</template>

<script>
import { getAccount, saveAccount } from '@/api/account'
import dataCatalogUtils from '@/utils/dataCatalogUtils'
import DataCatalog from '@/constant/dataCatalog'

export default {
  name: 'AccountDetail',
  data() {
    return {
      ruleForm: {
        userType: 2,
        userStatus: 0
      },
      rules: {
        username: [
          { required: true, message: '请填写用户名', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请填写密码', trigger: 'blur' }
        ],
        realName: [
          { required: true, message: '请填写真实姓名', trigger: 'blur' }
        ]
      },
      accountStatusOption: []
    }
  },
  async created() {
    this.accountStatusOption = await dataCatalogUtils.getData(DataCatalog.accountStatus)
    console.log(this.accountStatusOption)
    const id = this.$route.params.id
    if (id) {
      this.getAccount(id)
    }
  },
  methods: {
    getAccount: function(id) { // 获取菜单信息
      getAccount({ id: id }).then(res => {
        console.log(res.data)
        this.$message({ message: res.message, duration: 2000 })
        if (res.code === 200) {
          this.ruleForm = res.data
        }
      })
    },
    saveForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          saveAccount(this.ruleForm).then(res => {
            if (res.code === 200) {
              this.$message({ message: '保存成功！', duration: 2000 })
              this.ruleForm = res.data
            }
          })
        }
        return false
      })
    },
    goBack() {
      this.$router.go(-1)// 返回上一层
    }
  }
}
</script>

<style scoped>

</style>
