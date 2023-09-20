<template>
  <div class="app-container">
    <!--查询条件-->
    <div class="filter-container">
      <el-form-item label="用户名">
        <el-input v-model="listQuery.username" placeholder="用户名" />
      </el-form-item>
      <el-form-item>
        <el-button v-waves class="filter-item" round type="primary" @click="findAccountList">查询</el-button>
        <el-button v-waves class="filter-item" plain type="primary" @click="toDetail">新增</el-button>
        <el-button v-waves class="filter-item" plain type="primary" @click="deleteInfo">删除</el-button>
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
      <el-table-column align="center" label="序号" prop="" type="index" wdith="60" />
      <el-table-column align="center" label="用户名" prop="username" sortable>
        <template slot-scope="{row}">
          <span style="color: #409EFF;" @click="toDetail(row)">{{ row.username }}</span>
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

export default {
  name: 'AccountList',
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
    toDetail: function(row) {
      const id = row.id
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
