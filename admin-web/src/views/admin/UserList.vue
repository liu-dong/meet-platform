<template>
  <div class="app-container">
    <!--查询条件-->
    <div class="filter-container">
      <el-input v-model="listQuery.username" class="filter-item" placeholder="用户名"/>
      <button-search class="filter-item" @search="findUserList">查询</button-search>
      <button-reset class="filter-item" @reset="reset"/>
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
      <el-table-column align="center" label="用户名" prop="username" width="150">
        <template slot-scope="{row}">
          <span style="color: #409EFF;" @click="toDetail(row.id)">{{ row.username }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="手机号" prop="phone" width="150"/>
      <el-table-column align="center" label="邮箱" prop="email" />
      <el-table-column align="center" label="昵称" prop="nickname" />
      <el-table-column align="center" label="真实姓名" prop="realName" width="150">
        <template slot-scope="{row}">
          <span style="color: #409EFF;" @click="toPersonDetail(row.personId)">{{ row.realName }}</span>
        </template>
      </el-table-column>
      <el-table-column :formatter="formatType" align="center" label="用户类型" prop="userType" sortable width="150"/>
      <el-table-column :formatter="formatStatus" align="center" label="状态" prop="userStatus" sortable width="150"/>
      <el-table-column header-align="center" align="center" label="操作">
        <template slot-scope="{row}">
          <el-button
            v-for="action in getActions(row)"
            :key="action.label"
            type="text"
            size="mini"
            @click="action.handler(row)"
          >
            {{ action.label }}
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <!--分页-->
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="listQuery.page"
      :limit.sync="listQuery.limit"
      @pagination="findUserList"
    />
  </div>
</template>

<script>
import qs from 'qs'
import { deleteUser, findUserList } from '@/api/user'
import dataCatalogUtils from '@/utils/dataCatalogUtils'
import DataCatalog from '@/constant/dataCatalog'
import Pagination from '@/components/Pagination'
import waves from '@/directive/waves'
import ButtonReset from '@/components/Button/ButtonReset'
import ButtonSearch from '@/components/Button/ButtonSearch'

export default {
  name: 'UserList',
  components: { ButtonSearch, Pagination, ButtonReset },
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
      userTypeOption: [],
      accountStatusOption: []
    }
  },
  async created() {
    this.userTypeOption = await dataCatalogUtils.getData(DataCatalog.userType)
    this.findUserList()
  },
  methods: {
    formatStatus: function(row) {
      return dataCatalogUtils.getName(row.accountStatus, this.accountStatusOption)
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
    findUserList: function() {
      this.listLoading = true
      findUserList(this.listQuery).then(res => {
        if (res.code === 200) {
          this.list = res.data.dataList
          this.total = res.data.total
          this.listLoading = false
        }
      })
    },
    /**
     * 行操作按钮
     * @param row
     * @returns {[{handler: default.methods.toDetail, label: string},{handler: ((function(*): AxiosPromise<any>)|*|(function(*): AxiosPromise<any>)|(function(*): AxiosPromise<any>)), label: string}]}
     */
    getActions(row) {
      const assign = { label: '分配角色', handler: () => this.assignRoles(row) }
      const actions = [
        { label: '查看', handler: () => this.toDetail(row.id) }
      ]
      if (row.accountStatus === 1) {
        actions.push(assign)
      }
      return actions
    },
    toDetail: function(id) {
      this.$router.push({ name: 'userDetail', params: { id: id } })
    },
    assignRoles: function(row) {
      const params = { userId: row.id, username: row.username, userType: row.userType }
      console.log(params)
      this.$router.push({ name: 'userRoleDetail', params: params })
    },
    toPersonDetail: function(personId) {
      this.$router.push({ name: 'personDetail', params: { id: personId } })
    },
    deleteInfo: function() {
      const currentRow = this.currentRow
      if (JSON.stringify(currentRow) === '{}') {
        alert('请选择要删除的数据')
      }
      deleteUser(qs.stringify({ id: currentRow.id })).then(res => {
        console.log(res.data)
        this.$message({ message: res.message, duration: 2000 })
        if (res.code === 200) {
          this.findUserList()
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
