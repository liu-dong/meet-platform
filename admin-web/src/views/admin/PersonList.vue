<template>
  <div class="app-container">
    <!--查询条件-->
    <div class="filter-container">
      <el-input v-model="listQuery.name" placeholder="人员名称"/>
      <el-input v-model="listQuery.identityCard" placeholder="身份证号"/>
      <el-input v-model="listQuery.orgName" placeholder="单位名称"/>
      <button-search class="filter-item" @search="findPersonList">查询</button-search>
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
    >
      <el-table-column align="center" fixed label="序号" type="index" width="60" />
      <el-table-column align="center" label="姓名" prop="name" width="100">
        <template slot-scope="{row}">
          <span style="color: #409EFF;" @click="toDetail(row.id)">{{ row.name }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="年龄" prop="age" width="80" />
      <el-table-column :formatter="formatSex" align="center" label="性别" prop="sex" width="60" />
      <el-table-column align="center" label="手机" prop="phone" width="120" />
      <el-table-column align="center" label="邮箱" prop="email" width="200" />
      <el-table-column align="left" label="现住址" prop="presentAddress" />
      <el-table-column align="center" label="创建时间" prop="updateTime" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="{row}">
          <el-button type="primary" size="mini" @click="toDetail(row.id, 'view')">
            查看
          </el-button>
          <el-button type="primary" size="mini" @click="toDetail(row.id)">
            编辑
          </el-button>
          <el-button size="mini" type="danger" @click="deleteInfo(row)">
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
      @pagination="findPersonList"
    />
  </div>
</template>

<script>
import waves from '@/directive/waves' // waves directive
import Pagination from '@/components/Pagination' // secondary package based on el-pagination
import { deletePerson, findPersonList } from '@/api/person'
import ButtonSearch from '@/components/Button/ButtonSearch.vue'
import ButtonReset from '@/components/Button/ButtonReset.vue'
import ButtonAdd from '@/components/Button/ButtonAdd.vue'
import ButtonDelete from '@/components/Button/ButtonDelete.vue'

export default {
  name: 'PlanList',
  components: { ButtonDelete, ButtonAdd, ButtonReset, ButtonSearch, Pagination },
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
      }
    }
  },
  created() {
    this.findPersonList()
  },
  methods: {
    reset() {
      this.listQuery = {
        page: 1,
        limit: 10,
        name: undefined,
        identityCard: undefined,
        orgName: undefined
      }
    },
    findPersonList() {
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
    toDetail(id, viewType) {
      const params = {
        id,
        viewType
      }
      this.$router.push({ name: 'PersonDetail', params: params })
    },
    deleteInfo(row) {
      deletePerson(row.id).then(res => {
        this.$message({ message: res.message, duration: 2000 })
        if (res.code === 200) {
          this.findPersonList()
        }
      })
    }
  }
}
</script>
