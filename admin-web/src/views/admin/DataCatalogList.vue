<template>
  <div class="app-container">
    <!--查询条件-->
    <div class="filter-container">
      <el-form-item label="目录名称">
        <el-input v-model="listQuery.catalogCode" />
      </el-form-item>
      <el-form-item label="目录编码">
        <el-input v-model="listQuery.catalogName" />
      </el-form-item>
      <el-form-item>
        <el-button round type="primary" @click="findDataCatalogList">查询</el-button>
        <el-button plain type="primary" @click="toDetail">新增</el-button>
        <el-button type="danger" icon="el-icon-delete" circle @click="deleteInfo" />
      </el-form-item>
    </div>
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
      <el-table-column align="center" label="目录编码" prop="catalogCode">
        <template slot-scope="{row}">
          <span style="color: #409EFF;" @click="toDetail(row)">{{ row.catalogCode }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="目录名称" prop="catalogName" />
      <el-table-column align="center" label="状态" prop="status" />
      <el-table-column align="center" label="创建时间" prop="createTime" />
    </el-table>
    <!--分页-->
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="listQuery.page"
      :limit.sync="listQuery.limit"
      @pagination="getList"
    />
  </div>
</template>

<script>

import { deleteDataCatalog, findDataCatalogList } from '@/api/dataCatalog'

export default {
  name: 'AccountList',
  data() {
    return {
      tableKey: 0,
      list: null,
      total: 0,
      listLoading: true,
      listQuery: {
        page: 1,
        limit: 10,
        catalogCode: '',
        catalogName: ''
      },
      currentRow: {}
    }
  },
  created() {
    this.findDataCatalogList()
  },
  methods: {
    findDataCatalogList() {
      this.listLoading = true
      findDataCatalogList(this.listQuery).then(res => {
        if (res.code === 200) {
          this.list = res.data.dataList
          this.total = res.data.total
          this.listLoading = false
        }
      })
    },
    toDetail: function(row) {
      this.$router.push({
        name: 'dataCatalogDetail',
        params: { id: row.id }
      })
    },
    deleteInfo: function() {
      const currentRow = this.currentRow
      if (JSON.stringify(currentRow) === '{}') {
        this.$message({ message: '请选择要删除的数据', duration: 2000 })
        return
      }
      deleteDataCatalog({ id: currentRow.id }).then(res => {
        console.log(res.data)
        this.$message({ message: res.message, duration: 2000 })
        if (res.code === 200) {
          this.findDataCatalogList()
        }
      })
    },
    getCurrentRow(val) {
      this.currentRow = val
      console.log(this.currentRow)
    }
  }
}
</script>

<style scoped>

</style>
