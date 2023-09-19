<template>
  <div class="container">
    <div class="top">
      <el-breadcrumb separator-class="el-icon-arrow-right" style="padding-left: 15px;padding-top: 15px;">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>账号管理</el-breadcrumb-item>
        <el-breadcrumb-item>账号信息详情页</el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div class="bottom">
      <el-form ref="ruleForm" :model="ruleForm" :rules="rules" class="form" label-width="100px">
        <el-form-item label="用户名" prop="username">
          <el-input v-model="ruleForm.username" />
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input v-model="ruleForm.password" />
        </el-form-item>
        <el-form-item label="用户类型" prop="userType">
          <el-select v-model="ruleForm.userType" placeholder="请选择用户类型">
            <el-option
              v-for="item in userTypeOption"
              :key="item.propertyCode"
              :label="item.propertyName"
              :value="item.propertyCode-0"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="真实姓名" prop="realName">
          <el-input v-model="ruleForm.realName" />
        </el-form-item>
        <el-form-item label="是否注销" prop="userStatus">
          <el-switch v-model="ruleForm.userStatus" :active-value="0" :inactive-value="1" />
        </el-form-item>
        <el-form-item />
        <el-form-item prop="remark" style="width: 70%;height: 60%; overflow: auto">
          <el-transfer
            v-model="roleAccount.roleIdList"
            :button-texts="['删除角色', '添加角色']"
            :data="roleList"
            :format="{noChecked: '${total}',hasChecked: '${checked}/${total}'}"
            :props="{key: 'id',label: 'roleCode'}"
            :render-content="renderFunc"
            :titles="['角色列表', '所属角色']"
            filter-placeholder="请输入角色编码"
            filterable
            @change="addRole"
          />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="saveForm('ruleForm')">保存</el-button>
          <el-button @click="goBack()">返回</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
import { assignRoles, findAccountRoleInfoList, getAccount, saveAccount } from '@/api/account'
import { findRoleInfoList } from '@/api/role'
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
      userTypeOption: [],
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
    this.roleAccount.accountId = this.$route.params.id
    if (this.roleAccount.accountId) {
      this.getAccount(this.roleAccount.accountId)
    }
    this.findRoleInfoList()
  },
  methods: {
    getAccount: function(id) { // 获取菜单信息
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
.container {
  /*border: 1px solid red;*/
  width: 100%;
  height: 100%;
  box-shadow: 0 12px 24px 0 rgba(28, 31, 33, .1); /*添加阴影*/

}

.top {
  width: 100%;
  height: 10%;
  /*display: flex;*/
  /*flex-direction: column;*/
  /*justify-content: space-between;*/
}

.bottom {
  width: 100%;
  height: 90%;
}

.form {
  width: 100%;
  height: 100%;
  display: flex;
  flex-flow: row wrap;
  justify-content: center;
  align-items: flex-start;
}

.el-form-item {
  width: 35%;
  margin-bottom: 0;
}

/*控制穿梭框左右模块*/
.el-transfer-panel {
  width: 35%;
}

/*控制穿梭框按钮模块*/
.el-transfer__buttons {
  padding: 0;
}

.el-select {
  position: relative;
  font-size: 14px;
  display: inline-block;
  width: 100%;
}
</style>
