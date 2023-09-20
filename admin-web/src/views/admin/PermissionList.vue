<template>
  <div class="app-container">
    <!--查询条件-->
    <div class="filter-container">
      <el-form-item label="权限编码">
        <el-input v-model="listQuery.permissionCode" placeholder="权限编码" />
      </el-form-item>
      <el-form-item label="权限类型">
        <el-select v-model="listQuery.permissionType" placeholder="权限类型">
          <el-option label="页面权限" value="view" />
          <el-option label="操作权限" value="operate" />
          <el-option label="数据权限" value="data" />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" round @click="findPermissionList">查询</el-button>
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
      <el-table-column type="index" label="序号" />
      <el-table-column prop="permissionCode" sortable label="权限编码">
        <template slot-scope="{row}">
          <span style="color: #409EFF;" @click="toDetail(row)">{{ row.permissionCode }}</span>
        </template>
      </el-table-column>
      <el-table-column prop="permissionName" sortable label="权限名称" />
      <el-table-column prop="permissionType" sortable label="权限类型" />
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

export default {
  name: 'PermissionList',
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
    toDetail: function(row) {
      const id = row.id
      this.$router.push({ name: 'permissionDetail', params: { id: id }})
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
