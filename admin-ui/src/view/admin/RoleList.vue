<template>
  <div class="container">
    <div class="top">
      <el-breadcrumb separator-class="el-icon-arrow-right" style="padding-left: 15px;padding-top: 15px;">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>角色管理</el-breadcrumb-item>
        <el-breadcrumb-item>角色列表</el-breadcrumb-item>
      </el-breadcrumb>
      <el-form
          :inline="true"
          :model="roleInfo"
          class="demo-form-inline"
          style="padding-left: 15px;padding-bottom: 10px;"
      >
        <el-form-item label="角色名称">
          <el-input v-model="roleInfo.roleName" placeholder="人员名称"/>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="findRoleInfoList">查询</el-button>
          <el-button type="primary" plain @click="toDetail">新增</el-button>
          <el-button type="danger" icon="el-icon-delete" circle @click="deleteInfo"/>
        </el-form-item>
      </el-form>
    </div>
    <div class="bottom">
      <el-table
          :data="tableData.slice((currentPage-1) * pageSize, currentPage * pageSize)"
          :default-sort="{prop: 'updateTime', order: 'descending'}"
          :header-cell-style="{background:'#303133','text-align':'center'}"
          highlight-current-row
          @current-change="getCurrentRow"
      >
        <el-table-column fixed type="index" label="序号" align="center"/>
        <el-table-column prop="roleName" sortable label="角色编码" align="center">
          <template slot-scope="{row}">
            <span style="color: #409EFF;" @click="toDetail(row)">{{ row.roleCode }}</span>
          </template>
        </el-table-column>
        <el-table-column prop="roleName" sortable label="角色名称" align="center"/>
        <el-table-column prop="remark" label="角色描述" align="left"/>
        <el-table-column prop="createTime" sortable label="创建时间" align="center"/>
        <el-table-column label="操作类型" align="center">
          <template slot-scope="{row}">
            <el-link type="primary" style="margin-right: 10px;"
                     @click="toDetail(row,'account')"
            >添加账号
            </el-link>
            <el-link type="primary" @click="toDetail(row,'permission')">分配权限</el-link>
          </template>
        </el-table-column>
      </el-table>
      <el-pagination
          background
          style="padding: 10px;"
          layout="sizes, prev, pager, next, total"
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
import { deleteRoleInfo, findRoleInfoList } from '@/api/role'

export default {
  name: 'RoleList',
  data() {
    return {
      roleInfo: {},
      tableData: [],
      currentPage: 1, // 初始页
      pageSize: 10, // 每页的数据
      total: 1000,
      currentRow: {}
    }
  },
  created() {
    this.findRoleInfoList()
  },
  methods: {
    findRoleInfoList: function () { // 获取人员信息
      findRoleInfoList({}).then(res => {
        console.log(res.data)
        if (res.code === 200) {
          this.tableData = res.data.dataList
          this.total = res.data.total
        }
      })
    },
    toDetail: function (row, pageType) { // account：添加账号页面，permission：分配权限页面
      const id = row.id
      let pageName = 'roleDetail'
      if (pageType === 'account') {
        pageName = 'roleAccountDetail'
      } else if (pageType === 'permission') {
        pageName = 'rolePermissionDetail'
      }
      this.$router.push({name: pageName, params: {id: id}})
    },
    deleteInfo: function () {
      const currentRow = this.currentRow
      if (JSON.stringify(currentRow) === '{}') {
        this.$message({message: '请选择要删除的数据', duration: 2000})
        return
      }
      deleteRoleInfo(qs.stringify({id: currentRow.id})).then(res => {
        this.$message({message: res.message, duration: 2000})
        if (res.code === 200) {
          this.findRoleInfoList()
        }
      })
    },
    getCurrentRow(val) {
      this.currentRow = val
    },
    handleSizeChange: function (size) { // 改变每页大小
      this.pageSize = size
    },
    handleCurrentChange: function (currentPage) { // 改变页码
      this.currentPage = currentPage
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
  box-shadow: 0 12px 12px 0 rgba(28, 31, 33, .1); /*添加阴影*/
}

.top {
  width: 100%;
  height: 20%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.bottom {
  width: 100%;
  height: 80%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
}
</style>
