<template>
  <div class="app-container">
    <el-form ref="ruleForm" :model="ruleForm" :rules="rules" class="form" label-width="100px">
      <el-divider content-position="center">用户信息</el-divider>
      <avatar-upload class="avatar-upload" :image.sync="ruleForm.avatar" />
      <el-form-item label="昵称" prop="username">
        <el-input v-model="ruleForm.username"/>
      </el-form-item>
      <el-form-item label="用户类型" prop="userType">
        <el-select v-model="ruleForm.userType" placeholder="请选择用户类型">
          <el-option
            v-for="item in userTypeOption"
            :key="item.itemCode"
            :label="item.itemName"
            :value="item.itemCode-0"
          />
        </el-select>
      </el-form-item>
      <el-divider content-position="center">账号信息</el-divider>
      <el-form-item label="用户名" prop="username">
        <el-input v-model="ruleForm.username"/>
      </el-form-item>
      <el-form-item label="密码" prop="password">
        <el-input v-model="ruleForm.password"/>
      </el-form-item>
      <el-form-item label="手机号" prop="phone">
        <el-input v-model="ruleForm.phone"/>
      </el-form-item>
      <el-form-item label="邮箱" prop="email">
        <el-input v-model="ruleForm.email"/>
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
      <el-form-item/>
    </el-form>
    <div class="form-button">
      <el-button type="primary" @click="saveForm('ruleForm')">保存</el-button>
      <el-button @click="goBack()">返回</el-button>
    </div>
  </div>
</template>

<script>
import dataCatalogUtils from '@/utils/dataCatalogUtils'
import DataCatalog from '@/constant/dataCatalog'
import { getUser, saveUser } from '@/api/user'
import AvatarUpload from '@/views/admin/components/AvatarUpload.vue'

export default {
  name: 'UserDetail',
  components: { AvatarUpload },
  data() {
    return {
      ruleForm: {
        userType: 2,
        accountStatus: 1
      },
      rules: {
        username: [
          { required: true, message: '请填写用户名', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请填写密码', trigger: 'blur' }
        ],
        phone: [
          { required: true, message: '请填写手机号', trigger: 'blur' },
          { pattern: /^1[3-9]\d{9}$/, message: '手机号格式不正确', trigger: 'blur' }
        ],
        email: [
          { required: true, message: '请填写邮箱', trigger: 'blur' },
          { type: 'email', message: '邮箱格式不正确', trigger: 'blur' }
        ]
      },
      userTypeOption: [],
      accountStatusOption: []
    }
  },
  async created() {
    this.userTypeOption = await dataCatalogUtils.getData(DataCatalog.userType)
    this.accountStatusOption = await dataCatalogUtils.getData(DataCatalog.accountStatus)
    const id = this.$route.params.id
    if (id) {
      this.getUser(id)
    }
  },
  methods: {
    getUser: function(id) {
      getUser({ id: id }).then(res => {
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
          saveUser(this.ruleForm).then(res => {
            if (res.code === 200) {
              this.$message({ message: '保存成功！', duration: 2000 })
              this.goBack()
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
.avatar-upload {
  width: 100%;
  display: flex;
  justify-content: center;
}
</style>
