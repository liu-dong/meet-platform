<template>
  <div>
    <el-checkbox v-model="checkAll" :indeterminate="isIndeterminate" @change="handleCheckAllChange">全选</el-checkbox>
    <div style="margin: 15px 0;"/>
    <el-checkbox-group v-model="checked" @change="handleCheckedChange">
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
    // 选中的值
    checked: {
      type: Array,
      default: () => []
    }
  },
  data() {
    return {
      roleList: [] // 角色列表，初始化为空数组
    }
  },
  computed: {
    // 计算是否全部选中
    checkAll() {
      return this.roleList.length === this.checked.length
    },
    // 计算是否部分选中
    isIndeterminate() {
      return this.checked.length > 0 && this.checked.length < this.roleList.length
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
    // 全选操作
    handleCheckAllChange(val) {
      this.checked = val ? this.roleList.map(item => item.roleCode) : []
      // 修改选中的值
      this.$emit('update:checked', this.checked)
    },
    // 选中操作
    handleCheckedChange(value) {
      // 修改选中的值
      this.$emit('update:checked', value)
    }
  }
}
</script>
<style scoped>

</style>
