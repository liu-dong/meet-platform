<template>
  <div class="app-container">
    <!--查询条件-->
    <div class="filter-container">
      <el-input v-model="listQuery.orgName" class="filter-item" placeholder="人员名称" />
      <button-search class="filter-item" @search="findOrgList">查询</button-search>
      <button-reset class="filter-item" @reset="reset" />
      <button-add class="filter-item" @add="toDetail()">新增</button-add>
      <button-delete class="filter-item" @delete="deleteInfo" />
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
      <el-table-column fixed type="index" label="序号" align="center" width="60" />
      <el-table-column prop="orgName" sortable label="单位名称" align="center">
        <template slot-scope="{row}">
          <span style="color: #409EFF;" @click="toDetail(row.id)">{{ row.orgName }}</span>
        </template>
      </el-table-column>
      <el-table-column prop="orgCode" label="单位编码" align="center" />
      <el-table-column :formatter="formatType" prop="orgType" sortable label="单位类型" align="center" />
      <el-table-column prop="personSum" sortable label="人员数量" align="center" />
      <el-table-column label="操作类型" align="center">
        <template slot-scope="{row}">
          <el-link type="primary" @click="toDetail(row.id,'person')">添加人员</el-link>
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
import ButtonAdd from '@/components/Button/ButtonAdd'
import ButtonDelete from '@/components/Button/ButtonDelete'
import ButtonSearch from '@/components/Button/ButtonSearch'
import ButtonReset from '@/components/Button/ButtonReset'

export default {
  name: 'OrgList',
  components: { ButtonAdd, ButtonReset, ButtonDelete, ButtonSearch, Pagination },
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
    reset() {
      this.listQuery = {
        page: 1,
        limit: 10,
        orgName: undefined
      }
    },
    toDetail: function(id, pageType) { // account：添加账号页面，permission：分配权限页面
      let pageName = 'OrgDetail'
      if (pageType === 'person') {
        pageName = 'OrgPersonDetail'
      }
      this.$router.push({ name: pageName, params: { id: id } })
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
    formatType(row) {
      return row.orgType === 1 ? '商家单位' : '暂无该类型'
    }
  }
}
</script>

<style scoped>
</style>
