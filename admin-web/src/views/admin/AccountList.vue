<template>
  <div class="app-container">
    <!--查询条件-->
    <div class="filter-container">
      <el-input v-model="listQuery.username" class="filter-item" placeholder="用户名"/>
      <button-search class="filter-item" @search="findAccountList">查询</button-search>
      <button-reset class="filter-item" @reset="reset"/>
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
      <el-table-column align="center" label="序号" type="index" width="60"/>
      <el-table-column align="center" label="用户名" prop="username">
        <template slot-scope="{row}">
          <span style="color: #409EFF;" @click="toDetail(row.id)">{{ row.username }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="手机号" prop="phone"/>
      <el-table-column align="center" label="邮箱" prop="email"/>
      <el-table-column align="center" label="登录次数" prop="loginCount" sortable width="120"/>
      <el-table-column align="center" label="登录失败次数" prop="loginFailCount" sortable width="150"/>
      <el-table-column align="center" label="上次登录时间" prop="lastLoginTime" sortable/>
      <el-table-column align="center" label="注册时间" prop="createTime" sortable/>
      <el-table-column :formatter="formatStatus" align="center" label="状态" prop="accountStatus" sortable/>
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
      list: [],
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
      return row.accountStatus === 0 ? '正常' : '已注销'
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
          const { dataList, total } = res.data
          this.list = dataList
          this.total = total
          this.listLoading = false
        }
      })
    },
    toDetail: function(id) {
      this.$router.push({ name: 'accountDetail', params: { id: id } })
    },
    deleteInfo: function() {
      const currentRow = this.currentRow
      if (JSON.stringify(currentRow) === '{}') {
        alert('请选择要删除的数据')
      }
      deleteAccount(qs.stringify({ id: currentRow.id })).then(res => {
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
