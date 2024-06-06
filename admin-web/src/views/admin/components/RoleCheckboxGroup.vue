<template>
  <div>
    <el-checkbox v-model="checkAll" :indeterminate="isIndeterminate" @change="handleCheckAllChange">全选</el-checkbox>
    <div style="margin: 15px 0;"/>
    <el-checkbox-group v-model="checkedRoles" @change="handleCheckedRolesChange">
      <el-checkbox v-for="role in roleList" :key="role.roleCode" :label="role.roleCode">
        {{ role.roleName }}
      </el-checkbox>
    </el-checkbox-group>
  </div>
</template>
<script>
import { findAllRoleListMap } from '@/api/role'

export default {
  name: 'RoleCheckboxGroup',
  props: {
    checkedRoles: {
      type: Array,
      default: () => []
    }
  },
  data() {
    return {
      roleList: [] // 初始化为空数组
    }
  },
  computed: {
    checkAll() {
      return this.roleList.length === this.checkedRoles.length
    },
    isIndeterminate() {
      return this.checkedRoles.length > 0 && this.checkedRoles.length < this.roleList.length
    }
  },
  created() {
    // 组件创建时获取角色列表
    this.findAllRoleListMap()
  },
  methods: {
    // 查询角色信息
    findAllRoleListMap() {
      findAllRoleListMap().then(res => {
        if (res.code === 200) {
          this.roleList = res.data
        }
      })
    },
    handleCheckAllChange(val) {
      this.checkedRoles = val ? this.roleList.map(item => item.roleCode) : []
      this.$emit('update:checkedRoles', this.checkedRoles)
    },
    handleCheckedRolesChange(value) {
      this.$emit('update:checkedRoles', value)
      const checkedCount = value.length
      this.checkAll = checkedCount === this.roleList.length
      this.isIndeterminate = checkedCount > 0 && checkedCount < this.roleList.length
    }
  }
}
</script>
<style scoped>

</style>
