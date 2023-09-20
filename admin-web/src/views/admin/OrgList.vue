<template>
  <div class="container">
    <div class="top">
      <el-form-item label="单位名称">
        <el-input v-model="listQuery.orgName" placeholder="单位名称" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="findOrgList">查询</el-button>
        <el-button type="primary" plain @click="toDetail">新增</el-button>
        <el-button type="danger" icon="el-icon-delete" circle @click="deleteInfo" />
      </el-form-item>
    </div>
    <!--数据列表-->
    <el-table
      v-loading="listLoading"
      border
      :data="list"
      :header-cell-style="{background: '#b3d8ff50','text-align':'center'}"
      fit
      highlight-current-row
      style="width: 100%;"
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
    <!--分页-->
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="listQuery.page"
      :limit.sync="listQuery.limit"
      @pagination="findOrgList"
    />
  </div>
</template>

<script>
import qs from 'qs'
import { deleteOrg, findOrgList } from '@/api/org'
import Pagination from '@/components/Pagination'
import waves from '@/directive/waves'

export default {
  name: 'OrgList',
  components: { Pagination },
  directives: { waves },
  data() {
    return {
      tableKey: 0,
      list: null,
      total: 0,
      listLoading: true,
      listQuery: {
        page: 1,
        limit: 10,
        orgName: undefined
      },
      currentRow: {}
    }
  },
  created() {
    this.findOrgList()
  },
  methods: {
    findOrgList: function() {
      this.listLoading = true
      findOrgList(this.listQuery).then(res => {
        if (res.code === 200) {
          this.list = res.data.dataList
          this.total = res.data.total
          this.listLoading = false
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
