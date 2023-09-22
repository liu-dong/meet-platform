<template>
  <div class="app-container">
    <!--查询条件-->
    <div class="filter-container">
      <el-input v-model="listQuery.permissionCode" placeholder="权限编码" />
      <el-select v-model="listQuery.permissionType" placeholder="权限类型">
        <el-option label="页面权限" value="view" />
        <el-option label="操作权限" value="operate" />
        <el-option label="数据权限" value="data" />
      </el-select>
      <button-search @search="findPermissionList" />
      <button-reset @reset="reset" />
      <button-add @add="toDetail()" />
      <button-delete @delete="deleteInfo" />
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
      <el-table-column type="index" label="序号" width="60" align="center" />
      <el-table-column prop="permissionCode" label="权限编码">
        <template slot-scope="{row}">
          <span style="color: #409EFF;" @click="toDetail(row.id)">{{ row.permissionCode }}</span>
        </template>
      </el-table-column>
      <el-table-column prop="permissionName" label="权限名称" />
      <el-table-column prop="permissionType" label="权限类型" />
    </el-table>
    <!--分页-->
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="listQuery.page"
      :limit.sync="listQuery.limit"
      @pagination="findPermissionList"
    />
  </div>
</template>

<script>
import qs from 'qs'
import { deletePermission, findPermissionList } from '@/api/permission'
import Pagination from '@/components/Pagination'
import waves from '@/directive/waves'
import ButtonDelete from '@/components/Button/ButtonDelete'
import ButtonAdd from '@/components/Button/ButtonAdd'
import ButtonSearch from '@/components/Button/ButtonSearch'
import ButtonReset from '@/components/Button/ButtonReset'

export default {
  name: 'PermissionList',
  components: { ButtonReset, Pagination, ButtonDelete, ButtonAdd, ButtonSearch },
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
        permissionCode: undefined,
        permissionType: undefined
      },
      currentRow: {}
    }
  },
  created() {
    this.findPermissionList()
  },
  methods: {
    findPermissionList: function() { // 获取菜单信息
      this.listLoading = true
      findPermissionList(this.listQuery).then(res => {
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
        permissionCode: undefined,
        permissionType: undefined
      }
    },
    toDetail: function(id) {
      this.$router.push({ name: 'PermissionDetail', params: { id: id }})
    },
    deleteInfo: function() {
      const currentRow = this.currentRow
      if (JSON.stringify(currentRow) === '{}') {
        this.$message({ message: '请选择要删除的数据', duration: 2000 })
        return
      }
      deletePermission(qs.stringify({ id: currentRow.id })).then(res => {
        console.log(res.data)
        this.$message({ message: res.message, duration: 2000 })
        if (res.code === 200) {
          this.findPermissionList()
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
