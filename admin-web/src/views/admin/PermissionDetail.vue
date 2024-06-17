<template>
  <div class="app-container">
    <el-form ref="ruleForm" :model="ruleForm" :rules="rules" class="form" label-width="100px">
      <el-form-item label="权限类型" prop="permissionType">
        <el-select v-model="ruleForm.permissionType" placeholder="请选择菜单级别" @change="jointPermissionCode">
          <el-option label="页面权限" value="view" />
          <el-option label="操作权限" value="operate" />
          <el-option label="数据权限" value="data" />
        </el-select>
      </el-form-item>
      <el-form-item label="权限名称" prop="permissionName">
        <el-input v-model="ruleForm.permissionName" />
      </el-form-item>
      <el-form-item label="权限编码" prop="permissionCode">
        <el-input v-model="ruleForm.permissionCode" />
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
import { getPermission, savePermission } from '@/api/permission'
import { findMenuList } from '@/api/menu'

export default {
  name: 'PermissionDetail',
  data() {
    return {
      ruleForm: {
        permissionType: 'view',
        permissionName: '',
        permissionCode: 'VIEW_',
        resourceId: ''
      },
      rules: {
        permissionName: [
          { required: true, message: '请填写权限名称', trigger: 'blur' }
        ],
        permissionCode: [
          { required: true, message: '请填写权限编码', trigger: 'blur' }
        ]
      },
      menuList: []
    }
  },
  async created() {
    const id = this.$route.params.id
    const type = this.$route.params.type// type：1表示同级，2表示子级
    if (id && type) {
      const result = await this.getPermission(id)
      if (result.code === 200) {
        const permission = result.data
        this.ruleForm.parentId = parseInt(type) === 2 ? permission.id : permission.parentId
      }
    } else if (id) {
      await this.initPermission(id)
    }
    // this.findMenuList()
  },
  methods: {
    // 获取权限信息
    getPermission: async function(id) {
      return await getPermission({ id: id }).then(res => {
        console.log('permission:', res)
        return res
      })
    },
    // 初始化权限信息详情页
    initPermission: async function(id) {
      const info = await this.getPermission(id)
      this.$message({ message: info.message, duration: 2000 })
      if (info.code === 200) {
        this.ruleForm = info.data
      }
    },
    saveForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          savePermission(this.ruleForm).then(res => {
            this.$message({ message: res.message, duration: 2000 })
            if (res.code === 200) {
              this.ruleForm = res.data
              this.goBack()
            }
          })
        }
        return false
      })
    },
    //
    jointPermissionCode() {
      this.ruleForm.permissionCode = this.ruleForm.permissionType.toUpperCase() + '_'
    },
    goBack() {
      this.$router.go(-1)// 返回上一层
    },
    findMenuList: function() { // 获取菜单信息
      findMenuList({}).then(res => {
        console.log(res)
        if (res.code === 200) {
          this.menuList = res.data
        }
      })
    }
  }
}
</script>

<style scoped>

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
