<template>
  <div class="app-container">
    <!--查询条件-->
    <div class="filter-container">
      <el-input
        v-model="listQuery.name"
        clearable
        class="filter-item"
        placeholder="人员名称"
      />
      <el-input
        v-model="listQuery.identityCard"
        clearable
        class="filter-item"
        placeholder="身份证号"
      />
      <el-input
        v-model="listQuery.orgName"
        clearable
        class="filter-item"
        placeholder="单位名称"
      />
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">
        查询
      </el-button>
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-refresh-left" @click="reset">
        重置
      </el-button>
      <el-button
        v-waves
        class="filter-item"
        type="primary"
        icon="el-icon-edit"
        @click="toDetail"
      >
        新增
      </el-button>
    </div>
    <!--数据列表-->
    <el-table
      :key="tableKey"
      v-loading="listLoading"
      :data="list"
      border
      fit
      highlight-current-row
      style="width: 100%;"
    >
      <el-table-column align="center" fixed label="序号" type="index" wdith="60" />
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
      <el-table-column label="操作" align="center" min-width="250" class-name="small-padding fixed-width">
        <template slot-scope="{row}">
          <el-button type="primary" size="mini" @click="handleView(row)">
            查看
          </el-button>
          <el-button v-if="row.planStatus !== 3" type="primary" size="mini" @click="handleUpdate(row)">
            编辑
          </el-button>
          <el-button size="mini" type="danger" @click="handleDelete(row)">
            删除
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
      @pagination="getList"
    />
    <!--详情页-->
    <plan-detail
      :id="id"
      :key="id"
      :dialog-visible="dialogFormVisible"
      :dialog-status="dialogStatus"
      @close-dialog="closeDialog"
    />
  </div>
</template>

<script>
import { changePlanStatus, deletePlan } from '@/api/plan'
import waves from '@/directive/waves' // waves directive
import Pagination from '@/components/Pagination' // secondary package based on el-pagination
import PlanDetail from '@/views/plan/detail'
import { planStatusMap, planStatusOptions, planTypeMap, tagTypeMap } from '@/constant/plan'
import { findPersonList } from '@/api/person'

export default {
  name: 'PlanList',
  components: { Pagination, PlanDetail },
  directives: { waves },
  filters: {
    planTypeFilter(status) {
      return planTypeMap[status]
    },
    planStatusFilter(status) {
      return planStatusMap[status]
    },
    tagTypeFilter(status) {
      return tagTypeMap[status]
    }
  },
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
      id: '',
      planStatusOptions: planStatusOptions,
      dialogFormVisible: false,
      dialogStatus: ''
    }
  },
  created() {
    this.getList()
  },
  methods: {
    handleFilter() {
      this.listQuery.page = 1
      this.getList()
    },
    reset() {
      this.listQuery = {
        page: 1,
        limit: 10,
        name: undefined,
        identityCard: undefined,
        orgName: undefined
      }
    },
    getList() {
      this.listLoading = true
      findPersonList(this.listQuery).then(response => {
        if (response.code === 200) {
          this.list = response.data.dataList
          this.total = response.data.total
          this.listLoading = false
        }
      })
    },
    formatSex(row) {
      return row.sex === 0 ? '男' : '女'
    },
    changePlanStatus(id, planStatus) {
      changePlanStatus({ id, planStatus }).then(response => {
        if (response.code === 200) {
          this.$message({ type: 'success', message: response.message, duration: 2000 })
          this.getList()
        }
      })
    },
    toDetail(row) {
      // this.id = 'create'
      // this.dialogStatus = 'create'
      // this.dialogFormVisible = true
      const id = row.id
      this.$router.push({ name: 'personDetail', params: { id: id }})
    },
    handleUpdate(row) {
      this.id = row.id
      this.dialogStatus = 'update'
      this.dialogFormVisible = true
    },
    handleSummary(row) {
      this.id = row.id
      this.dialogStatus = 'summary'
      this.dialogFormVisible = true
    },
    handleView(row) {
      this.id = row.id
      this.dialogStatus = 'view'
      this.dialogFormVisible = true
    },
    handleDelete(row) {
      deletePlan(row.id).then(response => {
        this.$message({ type: 'success', message: response.message, duration: 2000 })
        if (response.code === 200) {
          this.getList()
        }
      })
    },
    closeDialog() {
      this.dialogFormVisible = false
      this.getList()
    }
  }
}
</script>
