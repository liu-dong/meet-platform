<template>
  <div class="app-container">
    <el-form ref="ruleForm" :model="ruleForm" :rules="rules" class="form" label-width="100px">
      <el-form-item label="角色编码" prop="roleCode">
        <el-input v-model="ruleForm.roleCode" :readonly="ruleForm.id"/>
      </el-form-item>
      <el-form-item label="角色名称" prop="roleName">
        <el-input v-model="ruleForm.roleName"/>
      </el-form-item>
      <el-form-item label="角色描述" prop="remark" style="width: 70%;">
        <el-input v-model="ruleForm.remark" type="textarea"/>
      </el-form-item>
      <el-form-item label="所属权限" style="width: 70%;" v-if="ruleForm.id">
        <el-tree
          ref="tree"
          :check-strictly="checkStrictly"
          :default-checked-keys="checkedPermissions"
          :data="permissionTree"
          :props="defaultProps"
          show-checkbox
          node-key="permissionCode"
          class="permission-tree"
        />
      </el-form-item>
    </el-form>
    <div class="form-button">
      <el-button type="primary" @click="saveForm('ruleForm')">保存</el-button>
      <el-button @click="goBack()">返回</el-button>
    </div>
  </div>
</template>

<script>
import { findRoleAccountList, findRolePermissionList, getRoleInfo, saveRoleInfo } from '@/api/role'
import dataCatalogUtils from '@/utils/dataCatalogUtils'
import DataCatalog from '@/constant/dataCatalog'
import { getPermissionTree } from "@/api/permission";
import { recursionData } from "@/utils";

export default {
  name: 'RoleDetail',
  data() {
    return {
      ruleForm: {},
      rules: {
        roleName: [
          { required: true, message: '请填写角色名称', trigger: 'blur' }
        ],
        roleCode: [
          { required: true, message: '请填写角色编码', trigger: 'blur' }
        ]
      },
      checkStrictly: false,
      defaultProps: {
        children: 'children',
        label: 'label'
      },
      // 权限树
      permissionTree: [],
      roleCode: '',
      checkedPermissions: []// 选中的权限集合数据
    }
  },
  async created() {
    this.getPermissionTree()
    const id = this.$route.params.id
    if (id) {
      this.getRoleInfo(id)
    }
    this.roleCode = this.$route.params.roleCode
    if (this.roleCode) {
      this.findRolePermissionList(this.roleCode)
    }
  },
  methods: {
    // 获取权限树
    getPermissionTree: function() {
      getPermissionTree({}).then(res => {
        if (res.code === 200) {
          const treeData = res.data
          recursionData(treeData)
          this.permissionTree = treeData
        }
      })
    },
    findRolePermissionList: function(roleCode) { // 获取角色权限信息
      findRolePermissionList({ roleCode: roleCode }).then(res => {
        if (res.code === 200) {
          this.checkedPermissions = res.data
        }
      })
    },
    // 查询角色信息
    getRoleInfo: function(id) {
      getRoleInfo({ id: id }).then(res => {
        this.$message({ message: res.message, duration: 2000 })
        if (res.code === 200) {
          this.ruleForm = res.data
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
    saveForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          saveRoleInfo(this.ruleForm).then(res => {
            this.$message({ message: res.message, duration: 2000 })
            if (res.code === 200) {
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

<style lang="scss" scoped>
.app-container {
  .permission-tree {
    margin-bottom: 30px;
  }
}

.form {
  width: 100%;
  height: 100%;
  display: flex;
  flex-flow: row wrap;
  justify-content: center;
  align-items: flex-start;

  .el-form-item {
    width: 35%;
  }
}

</style>
