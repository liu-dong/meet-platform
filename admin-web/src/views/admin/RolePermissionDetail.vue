<template>
  <div class="app-container">
    <div class="middle">
      <el-tree
        :data="permissionData"
        :default-checked-keys="checkedPermissions"
        :expand-on-click-node="false"
        default-expand-all
        node-key="permissionCode"
        :props="defaultProps"
        show-checkbox
        style="padding-left: 15px;"
        @check-change="checkChange"
      >
        <span slot-scope="{ node, data }" class="custom-tree-node">
          <span @click="toDetail(data.id)">{{ node.label }}</span>
        </span>
      </el-tree>
    </div>
    <div class="bottom">
      <el-button type="primary" @click="assignPermissions()">保存</el-button>
      <el-button @click="goBack()">返回</el-button>
    </div>
  </div>
</template>

<script>

import { getPermissionTree } from '@/api/permission'
import { assignPermissions, findRolePermissionList } from '@/api/role'
import { recursionData } from '@/utils'

export default {
  name: 'RolePermissionDetail',
  data() {
    return {
      defaultProps: {
        children: 'children',
        label: 'permissionName'
      },
      roleCode: '',
      permissionData: [], // 权限数据
      checkedPermissions: []// 选中的权限集合数据
    }
  },
  created() {
    this.getPermissionTree()
    this.roleCode = this.$route.params.roleCode
    if (this.roleCode) {
      this.findRolePermissionList(this.roleCode)
    }
  },
  methods: {
    getPermissionTree: function() { // 获取权限树
      getPermissionTree({}).then(res => {
        if (res.code === 200) {
          const treeData = res.data
          recursionData(treeData)
          this.permissionData = treeData
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
    /**
     *
     * @param data 当前选择的数据
     * @param checked 表示是否选中
     * @param indeterminate 节点的子树中是否有被选中的节点
     */
    checkChange(data, checked) {
      const array = this.checkedPermissions
      if (checked) { // 选中添加选中值
        array.push(data.permissionCode)
      } else { // 未选中删除选中值
        const index = array.findIndex(code => code === data.permissionCode)
        if (index !== -1) {
          array.splice(index, 1)
        }
      }
      this.checkedPermissions = array
      console.log('change：', this.checkedPermissions)
    },
    assignPermissions() {
      const data = {
        roleCode: this.roleCode,
        permissionCodeList: this.checkedPermissions
      }
      console.log('this.rolePermission：', this.data)
      assignPermissions(data).then(res => {
        this.$message({ message: res.message, duration: 2000 })
        if (res.code === 200) {
          this.goBack()
        }
      })
    },
    toDetail: function(id) {
      this.$router.push({ name: 'PermissionDetail', params: { id: id } })
    },
    goBack() {
      this.$router.go(-1)// 返回上一层
    }
  }
}
</script>

<style>

.middle {
  width: 100%;
  height: 70%;
}

.bottom {
  width: 100%;
  height: 20%;
  display: flex;
  justify-content: center;
  align-items: center;
}

.custom-tree-node {
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: space-between;
  font-size: 14px;
  padding-right: 8px;
}
</style>
