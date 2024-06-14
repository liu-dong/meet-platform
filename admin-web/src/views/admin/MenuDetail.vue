<template>
  <div class="app-container">
    <el-form ref="ruleForm" :model="ruleForm" :rules="rules" label-width="100px" class="form">
      <el-form-item label="父级菜单" prop="parentId">
        <el-select v-model="ruleForm.parentId">
          <el-option
            v-for="(item, index) in computedParentMenu"
            :key="index"
            :label="item.title || '/'"
            :value="item.id || '1'"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="菜单级别" prop="level">
        <el-select v-model="ruleForm.level" placeholder="请选择菜单级别">
          <el-option label="一级菜单" :value="1"/>
          <el-option label="二级菜单" :value="2"/>
          <el-option label="三级菜单" :value="3"/>
          <el-option label="四级菜单" :value="4"/>
        </el-select>
      </el-form-item>
      <el-form-item label="菜单名称" prop="title">
        <el-input v-model="ruleForm.title"/>
      </el-form-item>
      <el-form-item label="菜单编码" prop="permission">
        <el-input v-model="ruleForm.permission"/>
      </el-form-item>
      <el-form-item label="菜单图标" prop="icon">
        <el-select v-model="ruleForm.icon" placeholder="请选择菜单图标">
          <el-option value="table">
            <svg-icon icon-class="table"/>
          </el-option>
          <el-option value="form">
            <svg-icon icon-class="form"/>
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="布局" prop="icon">
        <el-select v-model="ruleForm.component" placeholder="请选择布局">
          <el-option value="Layout" label="Layout"/>
        </el-select>
      </el-form-item>
      <el-form-item label="路由路径" prop="path">
        <el-input v-model="ruleForm.path" @change="changeRouteName"/>
      </el-form-item>
      <el-form-item label="路由名称" prop="name">
        <el-input v-model="ruleForm.name" readonly/>
      </el-form-item>
      <el-form-item label="重定向" prop="redirect">
        <el-input v-model="ruleForm.redirect"/>
      </el-form-item>
      <el-form-item label="激活菜单" prop="activeMenu">
        <el-input v-model="ruleForm.activeMenu"/>
      </el-form-item>
      <el-form-item label="顺序" prop="sort">
        <el-input v-model="ruleForm.sort"/>
      </el-form-item>
      <el-form-item label="是否隐藏" prop="hidden">
        <el-switch v-model="ruleForm.hidden" :active-value="1" :inactive-value="0"/>
      </el-form-item>
      <el-form-item label="是否总是显示" prop="alwaysShow">
        <el-switch v-model="ruleForm.alwaysShow" :active-value="1" :inactive-value="0"/>
      </el-form-item>
      <el-form-item label="是否有子菜单" prop="hasChild">
        <el-switch v-model="ruleForm.hasChild" :active-value="1" :inactive-value="0"/>
      </el-form-item>
      <el-form-item label="菜单角色" prop="roles">
        <role-checkbox-group :checked.sync="checkedRoles"/>
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
import { findParentMenuRouteList, getMenuRoute, saveMenuRoute } from '@/api/menu'
import RoleCheckboxGroup from '@/views/admin/components/RoleCheckboxGroup.vue'
import { camelToUpperSnake } from '@/utils'

export default {
  name: 'MenuDetail',
  components: { RoleCheckboxGroup },
  data() {
    return {
      ruleForm: {
        id: undefined,
        parentId: undefined,
        title: undefined,
        name: undefined,
        path: undefined,
        level: 1,
        icon: undefined,
        sort: 1,
        hidden: 1,
        alwaysShow: 1,
        component: undefined,
        redirect: undefined,
        activeMenu: undefined,
        roles: undefined,
        permission: undefined
      },
      // 选中的角色
      checkedRoles: [],
      rules: {
        title: [
          { required: true, message: '请填写菜单名称', trigger: 'blur' }
        ],
        level: [
          { required: true, message: '请选择菜单级别', trigger: 'blur' }
        ],
        path: [
          { required: true, message: '请填写路由路径', trigger: 'blur' }
        ]
      },
      parentMenu: []
    }
  },
  computed: {
    computedParentMenu() {
      // 如果菜单级别是1，则仅显示根菜单选项
      if (this.ruleForm.level === 1) {
        return [{
          id: '1', // 假设1代表根菜单的id
          title: '/'
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
      const result = await this.getMenuRoute(id)
      if (result.code === 200) {
        const menu = result.data
        if (parseInt(type) === 1) {
          this.ruleForm.level = parseInt(menu.level)
          this.ruleForm.parentId = menu.parentId
        }
        this.ruleForm.level = parseInt(menu.level + 1)
        this.ruleForm.parentId = menu.id
      }
    } else if (id) {
      await this.initMenuRoute(id)
    }
    this.findParentMenuRouteList()// 查询父级菜单
  },
  methods: {
    getMenuRoute: async function(id) { // 获取菜单信息
      return await getMenuRoute({ id: id }).then(res => res)
    },
    initMenuRoute: async function(id) { // 获取菜单信息
      const result = await this.getMenuRoute(id)
      console.log(result)
      this.$message({ message: result.message, duration: 2000 })
      if (result.code === 200) {
        this.ruleForm = result.data
        if (result.data && result.data.roles) {
          this.checkedRoles = result.data.roles.split(',')
        }
      }
    },
    findParentMenuRouteList: function() { // 获取父级菜单信息
      const params = {
        title: '测试',
        limit: 10,
        page: 20
      }
      findParentMenuRouteList(params).then(res => {
        if (res.code === 200) {
          this.parentMenu = res.data
        }
      })
    },
    saveForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          const data = this.ruleForm
          if (this.checkedRoles.length > 0) {
            data.roles = this.checkedRoles.join(',')
          }
          saveMenuRoute(data).then(res => {
            this.$message({ message: res.message, duration: 2000 })
            if (res.code === 200) {
              this.goBack()
            }
          })
        }
        return false
      })
    },
    goBack() {
      this.$router.go(-1)// 返回上一层
    },
    changeRouteName() {
      let path = this.ruleForm.path
      // 检查menuUrl是否为空或只包含空白字符
      if (!path || !path.trim()) {
        // 返回原字符串，或根据需求可能抛出异常
        return path
      }
      // 如果第一个字符是'/'，则去除它
      if (path.startsWith('/')) {
        path = path.substring(1)
      }
      // 如果去除'/'后字符串为空，则直接返回
      if (path === '') {
        return path
      }
      // 将第一个字符转换为大写，然后拼接回其余的部分
      this.ruleForm.name = path.charAt(0).toUpperCase() + path.substring(1)
      this.ruleForm.permission = camelToUpperSnake(path)
    }
  }
}
</script>

<style scoped>

</style>
