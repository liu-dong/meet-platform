<template>
  <div class="app-container">
    <el-form ref="ruleForm" :model="ruleForm" :rules="rules" label-width="100px" class="form">
      <el-form-item label="父级菜单" prop="parentId">
        <el-select v-model="ruleForm.parentId">
          <el-option
            v-for="(item, index) in computedParentMenu"
            :key="index"
            :label="item.menuName || '/'"
            :value="item.id || '1'"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="菜单级别" prop="menuOrder">
        <el-select v-model="ruleForm.menuLevel" placeholder="请选择菜单级别">
          <el-option label="一级菜单" :value="1" />
          <el-option label="二级菜单" :value="2" />
          <el-option label="三级菜单" :value="3" />
          <el-option label="四级菜单" :value="4" />
        </el-select>
      </el-form-item>
      <el-form-item label="菜单名称" prop="menuName">
        <el-input v-model="ruleForm.menuName" />
      </el-form-item>
      <el-form-item label="菜单编码" prop="permission">
        <el-input v-model="ruleForm.hasChild" />
      </el-form-item>
      <el-form-item label="菜单图标" prop="menuIcon">
        <el-input v-model="ruleForm.menuIcon" />
      </el-form-item>
      <el-form-item label="菜单路径" prop="menuPath">
        <el-input v-model="ruleForm.menuPath" />
      </el-form-item>
      <el-form-item label="路由路径" prop="routePath">
        <el-input v-model="ruleForm.routePath" />
      </el-form-item>
      <el-form-item label="路由名称" prop="routeName">
        <el-input v-model="ruleForm.routeName" />
      </el-form-item>
      <el-form-item label="重定向" prop="redirect">
        <el-input v-model="ruleForm.redirect" />
      </el-form-item>
      <el-form-item label="激活菜单" prop="activeMenu">
        <el-input v-model="ruleForm.activeMenu" />
      </el-form-item>
      <el-form-item label="顺序" prop="menuSort">
        <el-input v-model="ruleForm.menuSort" />
      </el-form-item>
      <el-form-item label="是否隐藏" prop="menuStatus">
        <el-switch v-model="ruleForm.menuStatus" :active-value="1" :inactive-value="0" />
      </el-form-item>
      <el-form-item label="是否总是显示" prop="alwaysShow">
        <el-switch v-model="ruleForm.alwaysShow" :active-value="1" :inactive-value="0" />
      </el-form-item>
      <el-form-item label="是否有子菜单" prop="hasChild">
        <el-switch v-model="ruleForm.hasChild" :active-value="1" :inactive-value="0" />
      </el-form-item>
      <el-form-item label="菜单角色" prop="roles">
        <el-input v-model="ruleForm.roles" />
      </el-form-item>
    </el-form>
    <div class="form-button">
      <el-button type="primary" @click="saveForm('ruleForm')">保存</el-button>
      <el-button @click="goBack()">返回</el-button>
    </div>
  </div>
</template>

<script>
import { findParentMenuList, getMenu, saveMenu } from '@/api/menu'

export default {
  name: 'MenuDetail',
  data() {
    return {
      ruleForm: {
        menuName: '',
        menuIcon: '',
        menuOrder: 1,
        parentId: '1',
        menuLevel: 1,
        menuPath: '',
        menuUrl: '',
        menuStatus: 1,
        hasChild: false
      },
      rules: {
        menuName: [
          { required: true, message: '请填写菜单名称', trigger: 'blur' }
        ],
        menuLevel: [
          { required: true, message: '请选择菜单级别', trigger: 'blur' }
        ],
        menuPath: [
          { required: true, message: '请填写菜单路径', trigger: 'blur' }
        ],
        menuUrl: [
          { required: true, message: '请填写菜单地址', trigger: 'blur' }
        ]
      },
      parentMenu: []
    }
  },
  computed: {
    computedParentMenu() {
      // 如果菜单级别是1，则仅显示根菜单选项
      if (this.ruleForm.menuLevel === 1) {
        return [{
          id: '1', // 假设1代表根菜单的id
          menuName: '/'
        }]
      } else {
        // 否则返回可选的父级菜单列表
        return this.parentMenu
      }
    }
  },
  async created() {
    const id = this.$route.params.id
    const type = this.$route.params.type
    if (id && type) {
      const result = await this.getMenu(id)
      if (result.code === 200) {
        const menu = result.data
        if (parseInt(type) === 1) {
          this.ruleForm.menuLevel = parseInt(menu.menuLevel)
          this.ruleForm.parentId = menu.parentId
        }
        this.ruleForm.menuLevel = parseInt(menu.menuLevel + 1)
        this.ruleForm.parentId = menu.id
      }
    } else if (id) {
      await this.initMenu(id)
    }
    this.findParentMenuList()// 查询父级菜单
  },
  methods: {
    getMenu: async function(id) { // 获取菜单信息
      return await getMenu({ id: id }).then(res => res)
    },
    initMenu: async function(id) { // 获取菜单信息
      const info = await this.getMenu(id)
      console.log(info)
      this.$message({ message: info.message, duration: 2000 })
      if (info.code === 200) {
        this.ruleForm = info.data
      }
    },
    findParentMenuList: function() { // 获取父级菜单信息
      const params = {
        menuName: '测试',
        limit: 10,
        page: 20
      }
      findParentMenuList(params).then(res => {
        if (res.code === 200) {
          this.parentMenu = res.data
        }
      })
    },
    saveForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          saveMenu(this.ruleForm).then(res => {
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

<style scoped>

</style>
