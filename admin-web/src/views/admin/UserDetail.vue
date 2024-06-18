<template>
  <div class="app-container">
    <el-form ref="ruleForm" :model="ruleForm" :rules="rules" class="form" label-width="100px">
      <el-divider content-position="center">用户信息</el-divider>
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
      <el-form-item></el-form-item>
    </el-form>
    <div class="form-button">
      <el-button type="primary" @click="saveForm('ruleForm')">保存</el-button>
      <el-button @click="goBack()">返回</el-button>
    </div>
  </div>
</template>

<script>
import { assignRoles, findAccountRoleInfoList, getAccount, saveAccount } from '@/api/account'
import { findRoleInfoList } from '@/api/role'
import dataCatalogUtils from '@/utils/dataCatalogUtils'
import DataCatalog from '@/constant/dataCatalog'

export default {
  name: 'UserDetail',
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
      userTypeOption: [],
      accountStatusOption: [],
      roleList: [], // 账号信息列表
      roleAccount: { // 角色账号信息
        accountId: '',
        roleIdList: []// 角色id集合
      },
      renderFunc(h, option) { // 自定义列项名称
        return <span>{option.roleCode}({option.roleName})</span>
      }
    }
  },
  async created() {
    this.userTypeOption = await dataCatalogUtils.getData(DataCatalog.userType)
    this.accountStatusOption = await dataCatalogUtils.getData(DataCatalog.accountStatus)
    this.roleAccount.accountId = this.$route.params.id
    if (this.roleAccount.accountId) {
      this.getAccount(this.roleAccount.accountId)
    }
    this.findRoleInfoList()
  },
  methods: {
    getAccount: function(id) {
      getAccount({ id: id }).then(res => {
        console.log(res.data)
        this.$message({ message: res.message, duration: 2000 })
        if (res.code === 200) {
          this.ruleForm = res.data
          this.findAccountRoleInfoList(id)
        }
      })
    },
    // 查询账号的角色信息
    findAccountRoleInfoList(accountId) {
      console.log('accountId：', accountId)
      findAccountRoleInfoList({ accountId: accountId }).then(res => {
        console.log('角色：', res)
        if (res.code === 200) {
          if (res.data && res.data.length > 0) {
            this.roleAccount.roleIdList = res.data.map(item => item.id)
          }
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
    },
    findRoleInfoList: function() { // 获取人员信息
      findRoleInfoList({}).then(res => {
        console.log(res.data)
        if (res.code === 200) {
          this.roleList = res.data
        }
      })
    },
    // 分配角色
    addRole() {
      console.log('已选角色：', this.roleAccount)
      assignRoles(this.roleAccount).then(res => {
        if (res.code === 200) {
          this.$message({ message: res.message, duration: 2000 })
        }
      })
    }
  }
}
</script>

<style scoped>

</style>
