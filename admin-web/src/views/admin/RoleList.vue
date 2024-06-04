<template>
  <div class="app-container">
    <!--查询条件-->
    <div class="filter-container">
      <el-input v-model="listQuery.roleName" class="filter-item" placeholder="角色名称" />
      <button-search class="filter-item" @search="findRoleInfoList">查询</button-search>
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
      <el-table-column fixed type="index" label="序号" align="center" />
      <el-table-column prop="roleName" sortable label="角色编码" align="center">
        <template slot-scope="{row}">
          <span style="color: #409EFF;" @click="toDetail(row.id)">{{ row.roleCode }}</span>
        </template>
      </el-table-column>
      <el-table-column prop="roleName" sortable label="角色名称" align="center" />
      <el-table-column prop="remark" label="角色描述" align="left" />
      <el-table-column prop="createTime" sortable label="创建时间" align="center" />
      <el-table-column label="操作类型" align="center">
        <template slot-scope="{row}">
          <el-link
            type="primary"
            style="margin-right: 10px;"
            @click="toDetail(row,'account')"
          >添加账号
          </el-link>
          <el-link type="primary" @click="toDetail(row,'permission')">分配权限</el-link>
        </template>
      </el-table-column>
    </el-table>
    <!--分页-->
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="listQuery.page"
      :limit.sync="listQuery.limit"
      @pagination="findRoleInfoList"
    />
  </div>
</template>

<script>
import qs from 'qs'
import { deleteRoleInfo, findRoleInfoList } from '@/api/role'
import Pagination from '@/components/Pagination'
import waves from '@/directive/waves'
import ButtonSearch from '@/components/Button/ButtonSearch'
import ButtonDelete from '@/components/Button/ButtonDelete'
import ButtonAdd from '@/components/Button/ButtonAdd'
import ButtonReset from '@/components/Button/ButtonReset'

export default {
  name: 'RoleList',
  components: { ButtonReset, ButtonAdd, ButtonDelete, ButtonSearch, Pagination },
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
        roleName: undefined
      },
      currentRow: {}
    }
  },
  created() {
    this.findRoleInfoList()
  },
  methods: {
    findRoleInfoList: function() { // 获取人员信息
      this.listLoading = true
      findRoleInfoList(this.listQuery).then(res => {
        console.log(res.data)
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
        roleName: undefined
      }
    },
    // account：添加账号页面，permission：分配权限页面
    toDetail: function(row, pageType) {
      let pageName = 'RoleDetail'
      if (pageType === 'account') {
        pageName = 'RoleAccountDetail'
      } else if (pageType === 'permission') {
        pageName = 'RolePermissionDetail'
      }
      this.$router.push({ name: pageName, params: { id: row.id, roleCode: row.roleCode } })
    },
    deleteInfo: function() {
      const currentRow = this.currentRow
      if (JSON.stringify(currentRow) === '{}') {
        this.$message({ message: '请选择要删除的数据', duration: 2000 })
        return
      }
      deleteRoleInfo(qs.stringify({ id: currentRow.id })).then(res => {
        this.$message({ message: res.message, duration: 2000 })
        if (res.code === 200) {
          this.findRoleInfoList()
        }
      })
    },
    getCurrentRow(val) {
      this.currentRow = val
    }
  }
}
</script>

<style scoped>
</style>
