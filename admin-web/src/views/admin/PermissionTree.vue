<template>
  <div class="custom-tree-container">
    <div class="block">
      <p>权限树</p>
      <el-tree
        :data="permissionTreeData"
        :expand-on-click-node="false"
        default-expand-all
        node-key="id"
      >
        <span slot-scope="{ node, data }" class="custom-tree-node">
          <span @click="toDetail(data.id)">{{ node.label }}({{ data.permissionCode }})</span>
          <span>
            <el-button size="mini" type="text" @click="() => append(data,1)">添加同级权限</el-button>
            <el-button size="mini" type="text" @click="() => append(data,2)">添加子级权限</el-button>
            <el-button size="mini" type="text" @click="() => remove(node, data)">删除当前权限</el-button>
          </span>
        </span>
      </el-tree>
    </div>
  </div>
</template>

<script>

import { deletePermission, getPermissionTree } from '@/api/permission'

export default {
  name: 'PermissionTree',
  data() {
    return {
      permissionTreeData: []
    }
  },
  created() {
    this.getPermissionTree()
  },
  methods: {
    getPermissionTree: function() { // 获取菜单信息
      getPermissionTree({ type: 2 }).then(res => {
        if (res.code === 200) {
          const treeData = res.data
          this.recursionData(treeData)
          this.permissionTreeData = treeData
        }
      })
    },
    toDetail: function(id) {
      this.$router.push({ name: 'permissionDetail', params: { id: id }})
    },
    // 添加菜单 type：1表示同级菜单，2表示子级菜单
    append(data, type) {
      console.log(data, type)
      const id = data.id
      this.$router.push({ name: 'permissionDetail', params: { id: id, type: type }})
    },
    remove(node) {
      console.log('node：', node)
      this.$confirm('是否删除 ' + node.label + ' 菜单?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deletePermission(this.$qs.stringify({ id: node.key })).then(res => {
          console.log(res.data)
          this.$message({ message: res.message, duration: 2000 })
          if (res.code === 200) {
            this.getPermissionTree()
          }
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        })
      })
    },
    // 递归无限层数据
    recursionData(data) {
      return data.map(item => {
        item.label = item.permissionName
        const childrenData = item.children
        if (childrenData.length !== 0) {
          this.recursionData(childrenData)
        }
        return item
      })
    }
  }
}
</script>

<style>
.custom-tree-node {
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: space-between;
  font-size: 14px;
  padding-right: 8px;
}
</style>
