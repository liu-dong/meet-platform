<template>
  <div class="app-container">
    <!--查询条件-->
    <div class="filter-container">
      <el-input v-model="listQuery.username" class="filter-item" placeholder="用户名" />
      <button-search class="filter-item" @search="findAccountList">查询</button-search>
      <button-reset class="filter-item" @reset="reset" />
      <button-add class="filter-item" @add="toDetail">新增</button-add>
      <button-delete class="filter-item" @delete="deleteInfo">删除</button-delete>
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
      <el-table-column align="center" label="序号" type="index" width="60" />
      <el-table-column align="center" label="用户名" prop="username" sortable>
        <template slot-scope="{row}">
          <span style="color: #409EFF;" @click="toDetail(row.id)">{{ row.username }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="真实姓名" prop="realName" sortable>
        <template slot-scope="{row}">
          <span style="color: #409EFF;" @click="toPersonDetail(row)">{{ row.realName }}</span>
        </template>
      </el-table-column>
      <el-table-column :formatter="formatType" align="center" label="用户类型" prop="userType" sortable />
      <el-table-column align="center" label="上次登录时间" prop="lastLoginTime" sortable />
      <el-table-column align="center" label="登录次数" prop="loginCount" sortable />
      <el-table-column :formatter="formatStatus" align="center" label="状态" prop="userStatus" sortable />
    </el-table>
    <!--分页-->
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="listQuery.page"
      :limit.sync="listQuery.limit"
      @pagination="findAccountList"
    />
  </div>
</template>

<script>
import qs from 'qs'
import { deleteAccount, findAccountList } from '@/api/account'
import dataCatalogUtils from '@/utils/dataCatalogUtils'
import DataCatalog from '@/constant/dataCatalog'
import Pagination from '@/components/Pagination'
import waves from '@/directive/waves'
import ButtonReset from '@/components/Button/ButtonReset'
import ButtonSearch from '@/components/Button/ButtonSearch'
import ButtonDelete from '@/components/Button/ButtonDelete'
import ButtonAdd from '@/components/Button/ButtonAdd'

export default {
  name: 'AccountList',
  components: { ButtonAdd, ButtonDelete, ButtonSearch, Pagination, ButtonReset },
  directives: { waves },
  data() {
    return {
      list: null,
      total: 0,
      listLoading: true,
      listQuery: {
        page: 1,
        limit: 10,
        username: undefined
      },
      currentRow: {},
      userTypeOption: []
    }
  },
  async created() {
    this.userTypeOption = await dataCatalogUtils.getData(DataCatalog.userType)
    this.findAccountList()
  },
  methods: {
    formatStatus: function(row) {
      return row.userStatus === 0 ? '正常' : '已注销'
    },
    formatType: function(row) {
      return dataCatalogUtils.getName(row.userType, this.userTypeOption)
    },
    reset() {
      this.listQuery = {
        page: 1,
        limit: 10,
        username: undefined
      }
    },
    findAccountList: function() {
      this.listLoading = true
      findAccountList(this.listQuery).then(res => {
        if (res.code === 200) {
          this.list = res.data.dataList
          this.total = res.data.total
          this.listLoading = false
        }
      })
    },
    toDetail: function(id) {
      this.$router.push({ name: 'accountDetail', params: { id: id }})
    },
    toPersonDetail: function(row) {
      const id = row.personId
      alert(id)
      this.$router.push({ name: 'personDetail', params: { id: id }})
    },
    deleteInfo: function() {
      const currentRow = this.currentRow
      if (JSON.stringify(currentRow) === '{}') {
        alert('请选择要删除的数据')
      }
      deleteAccount(qs.stringify({ id: currentRow.id })).then(res => {
        console.log(res.data)
        this.$message({ message: res.message, duration: 2000 })
        if (res.code === 200) {
          this.findAccountList()
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
