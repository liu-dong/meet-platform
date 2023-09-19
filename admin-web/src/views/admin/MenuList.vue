<template>
  <div class="app-container">
    <!--查询条件-->
    <div class="filter-container">
      <el-input v-model="listQuery.menuName" placeholder="菜单名称" />
      <el-select v-model="listQuery.menuLevel" placeholder="菜单级别">
        <el-option label="一级菜单" value="1" />
        <el-option label="二级菜单" value="2" />
        <el-option label="三级菜单" value="3" />
        <el-option label="四级菜单" value="4" />
      </el-select>
      <el-button v-waves round type="primary" @click="findMenuList">查询</el-button>
      <el-button v-waves type="primary" icon="el-icon-search" @click="reset">
        重置
      </el-button>
      <el-button v-waves plain type="primary" @click="toDetail">新增</el-button>
      <el-button v-waves circle icon="el-icon-delete" type="danger" @click="deleteInfo" />
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
      <el-table-column label="序号" type="index" width="60" align="center" />
      <el-table-column align="center" label="菜单名称" prop="menuName">
        <template slot-scope="{row}">
          <span style="color: #409EFF;" @click="toDetail(row)">{{ row.menuName }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="顺序" prop="menuOrder" />
      <el-table-column :formatter="formatLevel" align="center" label="级别" prop="menuLevel" />
      <el-table-column align="center" label="菜单路径" prop="menuPath" />
      <el-table-column align="center" label="地址" prop="menuUrl" />
      <el-table-column :formatter="formatStatus" align="center" label="状态" prop="menuStatus" />
    </el-table>
    <!--分页-->
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="listQuery.page"
      :limit.sync="listQuery.limit"
      @pagination="findMenuList"
    />
  </div>
</template>

<script>
import { deleteMenu, findMenuList } from '@/api/menu'
import Pagination from '@/components/Pagination'
import waves from '@/directive/waves'

export default {
  name: 'MenuList',
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
        menuName: undefined,
        menuLevel: undefined
      },
      currentRow: {}
    }
  },
  created() {
    this.findMenuList()
  },
  methods: {
    formatStatus: function(row) {
      return row.menuStatus === 1 ? '显示' : '不显示'
    },
    formatLevel: function(row) {
      let level
      switch (row.menuLevel) {
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
        menuName: undefined,
        menuLevel: undefined
      }
    },
    findMenuList: function() { // 获取菜单信息
      this.listLoading = true
      findMenuList(this.listQuery).then(res => {
        if (res.code === 200) {
          this.list = res.data.dataList
          this.total = res.data.total
          this.listLoading = false
        }
      })
    },
    toDetail: function(row) {
      const id = row.id
      this.$router.push({ name: 'menuDetail', params: { id: id }})
    },
    deleteInfo: function() {
      const currentRow = this.currentRow
      if (JSON.stringify(currentRow) === '{}') {
        this.$message({ message: '请选择要删除的数据', duration: 2000 })
        return
      }
      deleteMenu({ id: currentRow.id }).then(res => {
        console.log(res.data)
        this.$message({ message: res.message, duration: 2000 })
        if (res.code === 200) {
          this.findMenuList()
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
.container {
  /*border: 1px solid red;*/
  width: 100%;
  height: 100%;
  /*两行居中*/
  /*display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;*/
  /*两行居中*/
  box-shadow: 0 12px 24px 0 rgba(28, 31, 33, .1); /*添加阴影*/
}

.top {
  /*border: 1px solid red;*/
  width: 100%;
  height: 20%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.bottom {
  /*border: 1px solid red;*/
  width: 100%;
  height: 80%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
}

</style>
