<template>
  <div class="app-container">
    <div style="font-weight: bolder;margin-bottom: 10px">菜单树</div>
    <el-tree
      :data="menuTreeData"
      :expand-on-click-node="false"
      draggable
      default-expand-all
      node-key="id"
    >
      <span slot-scope="{ node, data }" class="custom-tree-node">
        <span @click="toDetail(data.id)">{{ node.label }}</span>
        <span>
          <el-button size="mini" type="text" @click="() => append(data,1)">添加同级菜单</el-button>
          <el-button size="mini" type="text" @click="() => append(data,2)">添加子级菜单</el-button>
          <el-button size="mini" type="text" @click="() => remove(node, data)">删除当前菜单</el-button>
        </span>
      </span>
    </el-tree>
  </div>
</template>

<script>

import { deleteMenuRoute, getMenuRouteTree } from '@/api/menu'

export default {
  name: 'MenuTree',
  data() {
    return {
      menuTreeData: []
    }
  },
  created() {
    this.getMenuRouteTree()
  },
  methods: {
    getMenuRouteTree: function() { // 获取菜单信息
      getMenuRouteTree({ type: 2 }).then(res => {
        if (res.code === 200) {
          const treeData = res.data
          this.recursionData(treeData)
          this.menuTreeData = treeData
        }
      })
    },
    toDetail: function(id) {
      this.$router.push({ name: 'MenuDetail', params: { id: id } })
    },
    // 添加菜单 type：1表示同级菜单，2表示子级菜单
    append(data, type) {
      console.log(data, type)
      const id = data.id
      this.$router.push({ name: 'MenuDetail', params: { id: id, type: type } })
    },
    remove(node) {
      console.log('node：', node)
      this.$confirm('是否删除 ' + node.label + ' 菜单?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteMenuRoute({ id: node.key }).then(res => {
          console.log(res.data)
          this.$message({ message: res.message, duration: 2000 })
          if (res.code === 200) {
            this.getMenuRouteTree()
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
        item.label = item.title
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

.el-tree {
  width: 50%;
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
