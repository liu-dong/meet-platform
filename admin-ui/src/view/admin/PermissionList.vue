<template>
  <div class="container">
    <div class="top">
      <el-breadcrumb separator-class="el-icon-arrow-right" style="padding-left: 15px;padding-top: 15px;">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>权限管理</el-breadcrumb-item>
        <el-breadcrumb-item>权限列表</el-breadcrumb-item>
      </el-breadcrumb>
      <el-form
          :inline="true"
          :model="permission"
          class="demo-form-inline"
          style="padding-left: 15px;padding-bottom: 10px;"
      >
        <el-form-item label="权限编码">
          <el-input v-model="permission.permissionCode" placeholder="权限编码"/>
        </el-form-item>
        <el-form-item label="权限类型">
          <el-select v-model="permission.permissionType" placeholder="权限类型">
            <el-option label="页面权限" value="view"/>
            <el-option label="操作权限" value="operate"/>
            <el-option label="数据权限" value="data"/>
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" round @click="findPermissionList">查询</el-button>
          <el-button type="primary" plain @click="toDetail">新增</el-button>
          <el-button type="danger" icon="el-icon-delete" circle @click="deleteInfo"/>
        </el-form-item>
      </el-form>
    </div>
    <div class="bottom">
      <el-table
          :data="tableData.slice((currentPage-1) * pageSize, currentPage * pageSize)"
          :default-sort="{prop: 'permissionCode', order: 'descending'}"
          :header-cell-style="{background:'#303133','text-align':'center'}"
          height="0px"
          highlight-current-row
          @current-change="getCurrentRow"
      >
        <el-table-column type="index" label="序号"/>
        <el-table-column prop="permissionCode" sortable label="权限编码">
          <template slot-scope="{row}">
            <span style="color: #409EFF;" @click="toDetail(row)">{{ row.permissionCode }}</span>
          </template>
        </el-table-column>
        <el-table-column prop="permissionName" sortable label="权限名称"/>
        <el-table-column prop="permissionType" sortable label="权限类型"/>
      </el-table>
      <el-pagination
          background
          style="padding: 10px;"
          layout="sizes, prev, pagination, next, total"
          prev-text="上一页"
          next-text="下一页"
          :page-sizes="[5, 10, 15, 20]"
          :page-size="pageSize"
          :current-page="currentPage"
          :total="total"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
      />
    </div>
  </div>
</template>

<script>
import qs from 'qs'
import { deletePermission, findPermissionList } from '@/api/permission'

export default {
  name: 'PermissionList',
  data() {
    return {
      permission: {},
      tableData: [],
      currentPage: 1, // 初始页
      pageSize: 10, // 每页的数据
      total: 1000,
      currentRow: {}
    }
  },
  created() {
    this.findPermissionList()
  },
  methods: {
    findPermissionList: function () { // 获取菜单信息
      findPermissionList({}).then(res => {
        if (res.code === 200) {
          this.tableData = res.data.dataList
          this.total = res.data.total
        }
      })
    },
    toDetail: function (row) {
      const id = row.id
      this.$router.push({name: 'permissionDetail', params: {id: id}})
    },
    deleteInfo: function () {
      const currentRow = this.currentRow
      if (JSON.stringify(currentRow) === '{}') {
        this.$message({message: '请选择要删除的数据', duration: 2000})
        return
      }
      deletePermission(qs.stringify({id: currentRow.id})).then(res => {
        console.log(res.data)
        this.$message({message: res.message, duration: 2000})
        if (res.code === 200) {
          this.findPermissionList()
        }
      })
    },
    handleSizeChange: function (size) { // 改变每页大小
      this.pageSize = size
    },
    handleCurrentChange: function (currentPage) { // 改变页码
      this.currentPage = currentPage
    },
    getCurrentRow(val) {
      this.currentRow = val
    }
  }
}
</script>

<style scoped>
.container {
  /*border: 1px solid red;*/
  width: 100%;
  height: 100%;
  /*两行居中*/
  /*display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;*/
  /*两行居中*/
  box-shadow: 0 12px 24px 0 rgba(28, 31, 33, .1); /*添加阴影*/
}

.top {
  /*border: 1px solid red;*/
  width: 100%;
  height: 20%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.bottom {
  /*border: 1px solid red;*/
  width: 100%;
  height: 80%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
}

</style>
