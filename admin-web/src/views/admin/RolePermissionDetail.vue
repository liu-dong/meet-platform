<template>
  <div class="app-container">
    <div class="middle">
      <el-tree
        :data="permissionData"
        :default-checked-keys="rolePermission.permissionIdList"
        :expand-on-click-node="false"
        default-expand-all
        node-key="id"
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
import { recursionData } from "@/utils";

export default {
  name: 'RolePermissionDetail',
  data() {
    return {
      permissionData: [], // 权限数据
      rolePermission: { // 角色权限数据
        roleId: '',
        permissionIdList: []// 选中的数据
      }
    }
  },
  created() {
    this.getPermissionTree()
    this.rolePermission.roleId = this.$route.params.id
    if (this.rolePermission.roleId) {
      this.findRolePermissionList(this.rolePermission.roleId)
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
    findRolePermissionList: function(id) { // 获取角色权限信息
      findRolePermissionList({ roleId: id }).then(res => {
        if (res.code === 200) {
          this.rolePermission.roleId = res.data.roleId
          this.rolePermission.permissionIdList = res.data.permissionIdList
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
      const array = this.rolePermission.permissionIdList
      if (checked) { // 选中添加选中值
        array.push(data.id)
      } else { // 未选中删除选中值
        const index = array.findIndex(id => id === data.id)
        if (index !== -1) {
          array.splice(index, 1)
        }
      }
      this.rolePermission.permissionIdList = array
      console.log('change：', this.rolePermission)
    },
    assignPermissions() {
      console.log('this.rolePermission：', this.rolePermission)
      assignPermissions(this.rolePermission).then(res => {
        this.$message({ message: res.message, duration: 2000 })
        if (res.code === 200) {
          this.findRolePermissionList(res.data)
        }
      })
    },
    toDetail: function(id) {
      this.$router.push({ name: 'permissionDetail', params: { id: id }})
    },
    goBack() {
      this.$router.go(-1)// 返回上一层
    }
  }
}
</script>

<style>

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
