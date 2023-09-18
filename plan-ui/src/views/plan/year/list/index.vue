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
      <el-table-column label="计划名称" min-width="150">
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
      <el-table-column label="操作" align="center" width="230" class-name="small-padding fixed-width">
        <template slot-scope="{row}">
          <el-button type="primary" size="mini" @click="handleUpdate(row)">
            编辑
          </el-button>
          <el-button
            v-if="row.status!=='published'"
            size="mini"
            type="success"
            @click="handleModifyStatus(row,'published')"
          >
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

    <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible">
      <plan-detail @close="dialogFormVisible = $event" />
      <!--      <el-form ref="dataForm" :rules="rules" :model="temp" label-position="left" label-width="100px" style="width: 400px; margin-left:50px;">-->
      <!--        <el-form-item label="计划名称" prop="title">-->
      <!--          <el-input v-model="temp.title" />-->
      <!--        </el-form-item>-->
      <!--        <el-form-item label="计划类型" prop="type">-->
      <!--          <el-select v-model="temp.type" class="filter-item" placeholder="Please select">-->
      <!--            <el-option v-for="item in calendarTypeOptions" :key="item.key" :label="item.display_name" :value="item.key" />-->
      <!--          </el-select>-->
      <!--        </el-form-item>-->
      <!--        <el-form-item label="计划目标" prop="title">-->
      <!--          <el-input v-model="temp.title" />-->
      <!--        </el-form-item>-->
      <!--        <el-form-item label="计划内容" prop="title">-->
      <!--          <el-input v-model="temp.title" />-->
      <!--        </el-form-item>-->
      <!--        <el-form-item label="创建人" prop="title">-->
      <!--          <el-input v-model="temp.title" />-->
      <!--        </el-form-item>-->
      <!--      </el-form>-->
      <!--      <div slot="footer" class="dialog-footer">-->
      <!--        <el-button @click="dialogFormVisible = false">-->
      <!--          取消-->
      <!--        </el-button>-->
      <!--        <el-button type="primary" @click="dialogStatus==='create'?createData():updateData()">-->
      <!--          保存-->
      <!--        </el-button>-->
      <!--      </div>-->
    </el-dialog>
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
      planStatusOptions: [1, 2, 3],
      sortOptions: [{ label: 'ID Ascending', key: '+id' }, { label: 'ID Descending', key: '-id' }],
      statusOptions: ['published', 'draft', 'deleted'],
      showReviewer: false,
      dialogFormVisible: false,
      dialogStatus: '',
      textMap: {
        update: '编辑',
        create: '新增',
        view: '查看'
      },
      dialogPvVisible: false,
      downloadLoading: false
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
      this.dialogStatus = 'create'
      this.dialogFormVisible = true
    },
    handleUpdate(row) {
      this.temp = Object.assign({}, row) // copy obj
      this.temp.timestamp = new Date(this.temp.timestamp)
      this.dialogStatus = 'update'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    handleDelete(row) {
      deletePlan(row.id).then(response => {
        this.$message({ type: 'success', message: response.message, duration: 2000 })
        if (response.code === 200) {
          this.getList()
        }
      })
    }
  }
}
</script>
