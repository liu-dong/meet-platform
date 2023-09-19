<template>
  <div class="container">
    <div class="top">
      <el-breadcrumb separator-class="el-icon-arrow-right" style="padding-left: 15px;padding-top: 15px;">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>角色管理</el-breadcrumb-item>
        <el-breadcrumb-item>添加账号</el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div class="bottom">
      <el-form ref="ruleForm" :model="ruleForm" :rules="rules" class="form" label-width="100px">
        <el-form-item label="角色编码" prop="roleCode">
          <el-input v-model="ruleForm.roleCode" />
        </el-form-item>
        <el-form-item label="角色名称" prop="roleName">
          <el-input v-model="ruleForm.roleName" />
        </el-form-item>
        <el-form-item label="角色描述" prop="remark" style="width: 70%;">
          <el-input v-model="ruleForm.remark" type="textarea" />
        </el-form-item>
        <el-form-item prop="remark" style="width: 70%;height: 65%; overflow: auto">
          <el-transfer
            v-model="roleAccount.accountIdList"
            :button-texts="['删除账号', '添加账号']"
            :data="accountList"
            :format="{noChecked: '${total}',hasChecked: '${checked}/${total}'}"
            :props="{key: 'id',label: 'username'}"
            :render-content="renderFunc"
            :titles="['账号列表', '所属账号']"
            filterable
            filter-placeholder="请输入账号"
            @change="addAccount"
          />
        </el-form-item>
        <el-form-item>
          <el-button @click="goBack()">返回</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
import { findAccountList } from '@/api/account'
import { assignAccounts, findRoleAccountList, getRoleInfo } from '@/api/role'
import dataCatalogUtils from '@/util/dataCatalogUtils'
import DataCatalog from '@/constant/dataCatalog'

export default {
  name: 'RoleAccountDetail',
  data() {
    return {
      ruleForm: {},
      userTypeOption: [],
      accountList: [], // 账号信息列表
      roleAccount: { // 角色账号信息
        roleId: '',
        accountIdList: []// 账号id集合
      },
      renderFunc(h, option) { // 自定义列项名称
        return <span>{option.username}({option.realName})</span>
      }
    }
  },
  async created() {
    this.userTypeOption = await dataCatalogUtils.getData(DataCatalog.userType)
    this.roleAccount.roleId = this.$route.params.id
    if (this.roleAccount.roleId) {
      this.getRoleInfo(this.roleAccount.roleId)
    }
    this.findAccountList()
  },
  methods: {
    // 查询角色信息
    getRoleInfo: function(id) {
      getRoleInfo({ id: id }).then(res => {
        this.$message({ message: res.message, duration: 2000 })
        if (res.code === 200) {
          this.ruleForm = res.data
          this.findRoleAccountList(this.ruleForm.roleCode)
        }
      })
    },
    // 查询角色下所属账号信息
    findRoleAccountList(roleCode) {
      findRoleAccountList({ roleCode: roleCode }).then(res => {
        if (res.code === 200) {
          if (res.data && res.data.length > 0) {
            this.roleAccount.accountIdList = res.data.map(item => item.id)
          }
        }
      })
    },
    formatType: function(row) {
      return dataCatalogUtils.getName(row.userType, this.userTypeOption)
    },
    toAccountDetail(row) {
      const id = row.id
      this.$router.push({ name: 'accountDetail', params: { id: id }})
    },
    toPersonDetail: function(row) {
      const id = row.personId
      alert(id)
      this.$router.push({ name: 'personDetail', params: { id: id }})
    },
    goBack() {
      this.$router.go(-1)// 返回上一层
    },
    findAccountList: function() {
      findAccountList({}).then(res => {
        if (res.code === 200) {
          this.accountList = res.data
        }
      })
    },
    // 分配账号
    addAccount() {
      assignAccounts(this.roleAccount).then(res => {
        if (res.code === 200) {
          console.log(res)
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
</style>
