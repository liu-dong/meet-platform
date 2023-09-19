<template>
  <div class="container">
    <div class="top">
      <el-breadcrumb separator-class="el-icon-arrow-right" style="padding-left: 15px;padding-top: 15px;">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>单位管理</el-breadcrumb-item>
        <el-breadcrumb-item>单位列表</el-breadcrumb-item>
      </el-breadcrumb>
      <el-form
        :inline="true"
        :model="org"
        class="demo-form-inline"
        style="padding-left: 15px;padding-bottom: 10px;"
      >
        <el-form-item label="单位名称">
          <el-input v-model="org.orgName" placeholder="单位名称" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="findOrgList">查询</el-button>
          <el-button type="primary" plain @click="toDetail">新增</el-button>
          <el-button type="danger" icon="el-icon-delete" circle @click="deleteInfo" />
        </el-form-item>
      </el-form>
    </div>
    <div class="bottom">
      <el-table
        :data="tableData"
        :default-sort="{prop: 'updateTime', order: 'descending'}"
        :header-cell-style="{background:'#303133','text-align':'center'}"
        highlight-current-row
        @current-change="getCurrentRow"
      >
        <el-table-column fixed type="index" label="序号" align="center" />
        <el-table-column prop="orgName" sortable label="单位名称" align="center">
          <template slot-scope="{row}">
            <span style="color: #409EFF;" @click="toDetail(row)">{{ row.orgName }}</span>
          </template>
        </el-table-column>
        <el-table-column prop="orgCode" label="单位编码" align="center" />
        <el-table-column :formatter="formatType" prop="orgType" sortable label="单位类型" align="center" />
        <el-table-column prop="personSum" sortable label="人员数量" align="center" />
        <el-table-column label="操作类型" align="center">
          <template slot-scope="{row}">
            <el-link type="primary" @click="toDetail(row,'person')">添加人员</el-link>
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
import { deleteOrg, findOrgList } from '@/api/org'

export default {
  name: 'OrgList',
  data() {
    return {
      org: {},
      tableData: [],
      currentPage: 1, // 初始页
      pageSize: 10, // 每页的数据
      total: 1000,
      currentRow: {}
    }
  },
  created() {
    this.findOrgList()
  },
  methods: {
    findOrgList: function() {
      const data = { ...this.org }
      const params = {
        page: this.currentPage,
        limit: this.pageSize
      }
      findOrgList(data, params).then(res => {
        if (res.code === 200) {
          this.tableData = res.data.dataList
          this.total = res.data.total
        }
      })
    },
    toDetail: function(row, pageType) { // account：添加账号页面，permission：分配权限页面
      const id = row.id
      let pageName = 'orgDetail'
      if (pageType === 'person') {
        pageName = 'orgPersonDetail'
      }
      this.$router.push({ name: pageName, params: { id: id }})
    },
    deleteInfo: function() {
      const currentRow = this.currentRow
      if (JSON.stringify(currentRow) === '{}') {
        this.$message({ message: '请选择要删除的数据', duration: 2000 })
        return
      }
      deleteOrg(qs.stringify({ id: currentRow.id })).then(res => {
        this.$message({ message: res.message, duration: 2000 })
        if (res.code === 200) {
          this.findOrgList()
        }
      })
    },
    getCurrentRow(val) {
      this.currentRow = val
    },
    handleSizeChange: function(size) { // 改变每页大小
      this.pageSize = size
      this.findOrgList()
    },
    handleCurrentChange: function(currentPage) { // 改变页码
      this.currentPage = currentPage
      this.findOrgList()
    },
    formatType(row) {
      return row.orgType === 1 ? '商家单位' : '暂无该类型'
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
