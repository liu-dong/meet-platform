<template>
  <div class="app-container">
    <!--查询条件-->
    <div class="filter-container">

      <el-form-item label="姓名">
        <el-input v-model="listQuery.name" placeholder="人员名称" />
      </el-form-item>
      <el-form-item label="身份证号">
        <el-input v-model="listQuery.identityCard" placeholder="身份证号" />
      </el-form-item>
      <el-form-item label="单位名称">
        <el-input v-model="listQuery.orgName" placeholder="单位名称" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="findPersonList">查询</el-button>
        <el-button plain type="primary" @click="toDetail">新增</el-button>
        <el-button circle icon="el-icon-delete" type="danger" @click="deleteInfo" />
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
      <el-table-column align="center" fixed label="序号" type="index" />
      <el-table-column align="center" label="姓名" prop="name" sortable>
        <template slot-scope="{row}">
          <span style="color: #409EFF;" @click="toDetail(row)">{{ row.name }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="年龄" prop="age" sortable />
      <el-table-column :formatter="formatSex" align="center" label="性别" prop="sex" />
      <el-table-column align="center" label="手机" prop="phone" />
      <el-table-column align="center" label="邮箱" prop="email" />
      <el-table-column align="left" label="现住址" prop="presentAddress" sortable />
      <el-table-column align="center" label="创建时间" prop="updateTime" />
    </el-table>
    <!--分页-->
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="listQuery.page"
      :limit.sync="listQuery.limit"
      @pagination="findPersonList"
    />
  </div>
</template>

<script>
import qs from 'qs'
import { deletePerson, findPersonList } from '@/api/person'
import Pagination from '@/components/Pagination'
import waves from '@/directive/waves'

export default {
  name: 'PersonList',
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
        name: undefined,
        identityCard: undefined,
        orgName: undefined
      },
      currentRow: {}
    }
  },
  created() {
    this.findPersonList()
  },
  methods: {
    formatSex: function(row) {
      return row.sex === 0 ? '男' : '女'
    },
    // 获取人员信息
    findPersonList: function() {
      this.listLoading = true
      findPersonList(this.listQuery).then(res => {
        console.log(res.data)
        if (res.code === 200) {
          this.list = res.data.dataList
          this.total = res.data.total
          this.listLoading = false
        }
      })
    },
    toDetail: function(row) {
      const id = row.id
      this.$router.push({ name: 'personDetail', params: { id: id }})
    },
    deleteInfo: function() {
      const currentRow = this.currentRow
      if (JSON.stringify(currentRow) === '{}') {
        this.$message({ message: '请选择要删除的数据', duration: 2000 })
        return
      }
      deletePerson(qs.stringify({ id: currentRow.id })).then(res => {
        this.$message({ message: res.message, duration: 2000 })
        if (res.code === 200) {
          this.findPersonList()
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
