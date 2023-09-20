<template>
  <div class="app-container">
    <!--查询条件-->
    <div class="filter-container">

      <el-form-item label="角色名称">
        <el-input v-model="listQuery.roleName" placeholder="人员名称" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="findRoleInfoList">查询</el-button>
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
      <el-table-column fixed type="index" label="序号" align="center" />
      <el-table-column prop="roleName" sortable label="角色编码" align="center">
        <template slot-scope="{row}">
          <span style="color: #409EFF;" @click="toDetail(row)">{{ row.roleCode }}</span>
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

export default {
  name: 'RoleList',
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
    toDetail: function(row, pageType) { // account：添加账号页面，permission：分配权限页面
      const id = row.id
      let pageName = 'roleDetail'
      if (pageType === 'account') {
        pageName = 'roleAccountDetail'
      } else if (pageType === 'permission') {
        pageName = 'rolePermissionDetail'
      }
      this.$router.push({ name: pageName, params: { id: id }})
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
