<template>
  <div class="app-container">
    <!--查询条件-->
    <div class="filter-container">
      <el-input v-model="listQuery.catalogCode" class="filter-item" placeholder="目录名称" />
      <el-input v-model="listQuery.catalogName" class="filter-item" placeholder="目录编码" />
      <button-search class="filter-item" @search="findDataCatalogList" />
      <button-reset class="filter-item" @reset="reset" />
      <button-add class="filter-item" @add="toDetail()" />
      <button-delete class="filter-item" @delete="deleteInfo" />
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
          <span style="color: #409EFF;" @click="toDetail(row.id)">{{ row.catalogCode }}</span>
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
      @pagination="findDataCatalogList"
    />
  </div>
</template>

<script>

import { deleteDataCatalog, findDataCatalogList } from '@/api/dataCatalog'
import ButtonSearch from '@/components/Button/ButtonSearch'
import ButtonAdd from '@/components/Button/ButtonAdd'
import ButtonReset from '@/components/Button/ButtonReset'
import ButtonDelete from '@/components/Button/ButtonDelete'
import Pagination from '@/components/Pagination'

export default {
  name: 'DataCatalogList',
  components: { Pagination, ButtonDelete, ButtonAdd, ButtonReset, ButtonSearch },
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
    reset() {
      this.listQuery = {
        page: 1,
        limit: 10,
        catalogCode: '',
        catalogName: ''
      }
    },
    toDetail: function(id) {
      this.$router.push({
        name: 'DataCatalogDetail',
        params: { id: id }
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
