<template>
  <div class="app-container">
    <!--查询条件-->
    <div class="filter-container">
      <el-input
        v-model="listQuery.planName"
        placeholder="请输入计划名称"
        style="width: 200px;"
        class="filter-item"
        @keyup.enter.native="handleFilter"
      />
      <el-select
        v-model="listQuery.planStatus"
        placeholder="请选择计划状态"
        clearable
        style="width: 200px"
        class="filter-item"
      >
        <el-option v-for="item in planStatusOptions" :key="item" :label="item" :value="item" />
      </el-select>
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">
        查询
      </el-button>
      <el-button
        class="filter-item"
        style="margin-left: 10px;"
        type="primary"
        icon="el-icon-edit"
        @click="handleCreate"
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
      @sort-change="sortChange"
    >
      <el-table-column
        fixed
        label="序号"
        prop="id"
        align="center"
        width="60"
        type="index"
      />
      <el-table-column label="计划编码" width="150" align="center">
        <template slot-scope="{row}">
          <span>{{ row.planCode }}</span>
        </template>
      </el-table-column>
      <el-table-column label="计划名称" width="300">
        <template slot-scope="{row}">
          <span>{{ row.planName }}</span>
        </template>
      </el-table-column>
      <el-table-column label="计划类型" width="110" align="center">
        <template slot-scope="{row}">
          <el-tag>{{ row.planType | planTypeFilter }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="计划状态" width="110" align="center">
        <template slot-scope="{row}">
          <el-tag :type="row.planStatus | statusFilter">{{ row.planStatus | planStatusFilter }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" width="180" align="center">
        <template slot-scope="{row}">
          <span>{{ row.createTime }}</span>
        </template>
      </el-table-column>
      <el-table-column label="创建人" align="center" width="150">
        <template slot-scope="{row}">
          <span>{{ row.createUserId }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" min-width="250" class-name="small-padding fixed-width">
        <template slot-scope="{row}">
          <el-button type="primary" size="mini" @click="handleView(row)">
            查看
          </el-button>
          <el-button type="primary" size="mini" @click="handleUpdate(row)">
            编辑
          </el-button>
          <el-button size="mini" type="success" @click="handleModifyStatus(row,'published')">
            发布
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
import { deletePlan, findPlanList } from '@/api/plan'
import waves from '@/directive/waves' // waves directive
import Pagination from '@/components/Pagination' // secondary package based on el-pagination
import PlanDetail from '@/views/plan/year/detail' // secondary package based on el-pagination

export default {
  name: 'PlanList',
  components: { Pagination, PlanDetail },
  directives: { waves },
  filters: {
    planTypeFilter(status) {
      const planTypeMap = {
        day: '日计划',
        week: '周计划',
        month: '月度计划',
        quarter: '季度计划',
        year: '年度计划'
      }
      return planTypeMap[status]
    },
    planStatusFilter(status) {
      const planStatusMap = {
        1: '未开始',
        2: '进行中',
        3: '已完成',
        4: '延期'
      }
      return planStatusMap[status]
    },
    statusFilter(status) {
      const statusMap = {
        1: 'info',
        2: '',
        3: 'success',
        4: 'warning'
      }
      return statusMap[status]
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
        planName: undefined,
        planStatus: undefined,
        planType: undefined
      },
      id: '',
      planStatusOptions: [1, 2, 3],
      dialogFormVisible: false,
      dialogStatus: ''
    }
  },
  created() {
    this.getList()
  },
  methods: {
    getList() {
      this.listLoading = true
      findPlanList(this.listQuery).then(response => {
        this.list = response.data.dataList
        this.total = response.data.total
        this.listLoading = false
      })
    },
    handleFilter() {
      this.listQuery.page = 1
      this.getList()
    },
    handleModifyStatus(row, status) {
      this.$message({
        message: '操作Success',
        type: 'success'
      })
      row.status = status
    },
    sortChange(data) {
      const { prop, order } = data
      if (prop === 'id') {
        this.sortByID(order)
      }
    },
    sortByID(order) {
      if (order === 'ascending') {
        this.listQuery.sort = '+id'
      } else {
        this.listQuery.sort = '-id'
      }
      this.handleFilter()
    },
    resetTemp() {
      this.temp = {
        id: undefined,
        importance: 1,
        remark: '',
        timestamp: new Date(),
        title: '',
        status: 'published',
        type: ''
      }
    },
    handleCreate() {
      this.id = 'create'
      this.dialogStatus = 'create'
      this.dialogFormVisible = true
    },
    handleUpdate(row) {
      this.id = row.id
      this.dialogStatus = 'update'
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
