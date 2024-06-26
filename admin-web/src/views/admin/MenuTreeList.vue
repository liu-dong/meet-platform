<template>
  <div class="app-container">
    <!--查询条件-->
    <div class="filter-container">
      <el-input v-model="listQuery.title" class="filter-item" placeholder="菜单名称"/>
      <el-select v-model="listQuery.level" class="filter-item" placeholder="菜单级别">
        <el-option label="一级菜单" value="1"/>
        <el-option label="二级菜单" value="2"/>
        <el-option label="三级菜单" value="3"/>
        <el-option label="四级菜单" value="4"/>
      </el-select>
      <button-search class="filter-item" @search="findMenuRouteTreeList"/>
      <button-reset class="filter-item" @reset="reset"/>
      <button-add class="filter-item" @add="toDetail()"/>
      <button-delete class="filter-item" @delete="deleteInfo"/>
    </div>
    <!--数据列表-->
    <el-table
      :key="tableKey"
      v-loading="listLoading"
      border
      :data="list"
      :header-cell-style="{background: '#b3d8ff50','text-align':'center'}"
      fit
      highlight-current-row
      style="width: 100%;"
      row-key="id"
      :tree-props="{children: 'children', hasChildren: 'hasChildren'}"
      @current-change="getCurrentRow"
    >
      <el-table-column :formatter="formatLevel" align="center" label="菜单级别" prop="level"/>
      <el-table-column align="center" label="菜单顺序" prop="sort"/>
      <el-table-column align="center" label="菜单名称" prop="title">
        <template slot-scope="{row}">
          <span style="color: #409EFF;" @click="toDetail(row)">{{ row.title }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="路由名称" prop="name"/>
      <el-table-column align="center" label="路由路径" prop="path"/>
      <el-table-column :formatter="formatStatus" align="center" label="菜单状态" prop="hidden"/>
    </el-table>
    <!--分页-->
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="listQuery.page"
      :limit.sync="listQuery.limit"
      @pagination="findMenuRouteTreeList"
    />
  </div>
</template>

<script>
import { deleteMenuRoute, findMenuRouteTreeList } from '@/api/menu'
import Pagination from '@/components/Pagination'
import waves from '@/directive/waves'
import ButtonSearch from '@/components/Button/ButtonSearch.vue'
import ButtonReset from '@/components/Button/ButtonReset.vue'
import ButtonAdd from '@/components/Button/ButtonAdd.vue'
import ButtonDelete from '@/components/Button/ButtonDelete.vue'

export default {
  name: 'MenuList',
  components: { ButtonDelete, ButtonAdd, ButtonReset, ButtonSearch, Pagination },
  directives: { waves },
  data() {
    return {
      tableKey: 0,
      list: [],
      total: 0,
      listLoading: true,
      listQuery: {
        page: 1,
        limit: 10,
        title: undefined,
        level: undefined
      },
      currentRow: {}
    }
  },
  created() {
    this.findMenuRouteTreeList()
  },
  methods: {
    formatStatus: function(row) {
      return row.hidden === 1 ? '隐藏' : '显示'
    },
    formatLevel: function(row) {
      let level
      switch (row.level) {
        case 1:
          level = '一级菜单'
          break
        case 2:
          level = '二级菜单'
          break
        case 3:
          level = '三级菜单'
          break
        case 4:
          level = '四级菜单'
          break
        default:
          level = '未设置'
      }
      return level
    },
    reset() {
      this.listQuery = {
        page: 1,
        limit: 10,
        title: undefined,
        level: undefined
      }
    },
    findMenuRouteTreeList: function() { // 获取菜单信息
      this.listLoading = true
      findMenuRouteTreeList(this.listQuery).then(res => {
        if (res.code === 200) {
          this.list = res.data.dataList
          this.total = res.data.total
          this.listLoading = false
          this.tableKey += 1 // 更新 tableKey 来强制重新渲染表格
        }
      })
    },
    toDetail: function(row) {
      const id = row ? row.id : undefined
      this.$router.push({ name: 'MenuDetail', params: { id: id } })
    },
    deleteInfo: function() {
      const currentRow = this.currentRow
      if (JSON.stringify(currentRow) === '{}') {
        this.$message({ message: '请选择要删除的数据', duration: 2000 })
        return
      }
      deleteMenuRoute({ id: currentRow.id }).then(res => {
        console.log(res.data)
        this.$message({ message: res.message, duration: 2000 })
        if (res.code === 200) {
          this.findMenuRouteTreeList()
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
