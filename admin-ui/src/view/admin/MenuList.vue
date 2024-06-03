<template>
  <div class="container">
    <div class="top">
      <el-breadcrumb separator-class="el-icon-arrow-right" style="padding-left: 15px;padding-top: 15px;">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>菜单管理</el-breadcrumb-item>
        <el-breadcrumb-item>菜单列表</el-breadcrumb-item>
      </el-breadcrumb>
      <el-form
          :inline="true"
          :model="menu"
          class="demo-form-inline"
          style="padding-left: 15px;padding-bottom: 10px;"
      >
        <el-form-item label="菜单名称">
          <el-input v-model="menu.menuName" placeholder="菜单名称"/>
        </el-form-item>
        <el-form-item label="菜单级别">
          <el-select v-model="menu.menuLevel" placeholder="菜单级别">
            <el-option label="一级菜单" value="1"/>
            <el-option label="二级菜单" value="2"/>
            <el-option label="三级菜单" value="3"/>
            <el-option label="四级菜单" value="4"/>
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button round type="primary" @click="findMenuList">查询</el-button>
          <el-button plain type="primary" @click="toDetail">新增</el-button>
          <el-button circle icon="el-icon-delete" type="danger" @click="deleteInfo"/>
        </el-form-item>
      </el-form>
    </div>
    <div class="bottom">
      <el-table
          :data="tableData"
          :header-cell-style="{background:'#303133','text-align':'center'}"
          height="0px"
          highlight-current-row
          @current-change="getCurrentRow"
      >
        <el-table-column label="序号" type="index"/>
        <el-table-column align="center" label="菜单名称" prop="menuName">
          <template slot-scope="{row}">
            <span style="color: #409EFF;" @click="toDetail(row)">{{ row.menuName }}</span>
          </template>
        </el-table-column>
        <el-table-column align="center" label="顺序" prop="menuOrder"/>
        <el-table-column :formatter="formatLevel" align="center" label="级别" prop="menuLevel"/>
        <el-table-column align="center" label="菜单路径" prop="menuPath"/>
        <el-table-column align="center" label="地址" prop="menuUrl"/>
        <el-table-column :formatter="formatStatus" align="center" label="状态" prop="menuStatus"/>
      </el-table>
      <el-pagination
          :current-page="currentPage"
          :page-size="pageSize"
          :page-sizes="[5, 10, 15, 20]"
          :total="total"
          background
          layout="sizes, prev, pagination, next, total"
          next-text="下一页"
          prev-text="上一页"
          style="padding: 10px;"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
      />
    </div>
  </div>
</template>

<script>
import { deleteMenu, findMenuList } from '@/api/menu'

export default {
  name: 'MenuList',
  data() {
    return {
      menu: {},
      tableData: [],
      currentPage: 1, // 初始页
      pageSize: 10, // 每页的数据
      total: 1000,
      currentRow: {}
    }
  },
  created() {
    this.findMenuList()
  },
  methods: {
    formatStatus: function (row) {
      return row.menuStatus === 1 ? '显示' : '不显示'
    },
    formatLevel: function (row) {
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
    findMenuList: function () { // 获取菜单信息
      const param = {
        limit: this.pageSize,
        page: this.currentPage
      }
      findMenuList(this.menu, param).then(res => {
        if (res.code === 200) {
          this.tableData = res.data.dataList
          this.total = res.data.total
        }
      })
    },
    toDetail: function (row) {
      const id = row.id
      this.$router.push({name: 'menuDetail', params: {id: id}})
    },
    deleteInfo: function () {
      const currentRow = this.currentRow
      if (JSON.stringify(currentRow) === '{}') {
        this.$message({message: '请选择要删除的数据', duration: 2000})
        return
      }
      deleteMenu({id: currentRow.id}).then(res => {
        console.log(res.data)
        this.$message({message: res.message, duration: 2000})
        if (res.code === 200) {
          this.findMenuList()
        }
      })
    },
    // 改变每页大小
    handleSizeChange: function (size) {
      this.pageSize = size
      this.findMenuList()
    },
    // 改变页码
    handleCurrentChange: function (currentPage) {
      this.currentPage = currentPage
      this.findMenuList()
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
