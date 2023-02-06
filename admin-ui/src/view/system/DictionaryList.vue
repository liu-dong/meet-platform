<template>
  <div class="container">
    <div class="top">
      <el-breadcrumb separator-class="el-icon-arrow-right" style="padding-left: 15px;padding-top: 15px;">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>数据字典</el-breadcrumb-item>
        <el-breadcrumb-item>数据字典列表</el-breadcrumb-item>
      </el-breadcrumb>
      <el-form
          :inline="true"
          class="demo-form-inline"
          style="padding-left: 15px;padding-bottom: 10px;"
      >
        <el-form-item label="键名">
          <el-input v-model="keyName"/>
        </el-form-item>
        <el-form-item>
          <el-button round type="primary" @click="findDataDictionaryList">查询</el-button>
          <el-button plain type="primary" @click="toDetail">新增</el-button>
          <el-button type="danger" icon="el-icon-delete" circle @click="deleteInfo"/>
        </el-form-item>
      </el-form>
    </div>
    <div class="bottom">
      <el-table
          :data="tableData.slice((currentPage-1) * pageSize, currentPage * pageSize)"
          :default-sort="{prop: 'categoryCode', order: 'ascending'}"
          :header-cell-style="{background:'#303133','text-align':'center'}"
          height="0px"
          highlight-current-row
          @current-change="getCurrentRow"
      >
        <el-table-column align="center" label="分类名称" prop="categoryName"/>
        <el-table-column label="分类编码" prop="categoryCode">
          <template slot-scope="{row}">
            <span style="color: #409EFF;" @click="toDetail(row)">{{ row.categoryCode }}</span>
          </template>
        </el-table-column>
      </el-table>
      <el-pagination
          :current-page="currentPage"
          :page-size="pageSize"
          :page-sizes="[5, 10, 15, 20]"
          :total="total"
          background
          layout="sizes, prev, pager, next, total"
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

import {deleteDataDictionaryInfo, findDataDictionaryList} from '@/api/dataDictionary'

export default {
  name: 'AccountList',
  data() {
    return {
      keyName: '',
      tableData: [],
      currentPage: 1, // 初始页
      pageSize: 10, // 每页的数据
      total: 1000,
      currentRow: {}
    }
  },
  created() {
    this.findDataDictionaryList()
  },
  methods: {
    findDataDictionaryList: function () {
      findDataDictionaryList({}).then(res => {
        console.log(res)
        if (res.code === 200) {
          this.tableData = res.data
          this.total = res.data.length
        }
      })
    },
    toDetail: function (row) {
      const categoryCode = row.categoryCode
      this.$router.push({
        name: 'dictionaryDetail',
        params: {categoryCode: categoryCode}
      })
    },
    deleteInfo: function () {
      const currentRow = this.currentRow
      if (JSON.stringify(currentRow) === '{}') {
        this.$message({message: '请选择要删除的数据', duration: 2000})
        return
      }
      deleteDataDictionaryInfo({categoryCode: currentRow.categoryCode}).then(res => {
        console.log(res.data)
        this.$message({message: res.message, duration: 2000})
        if (res.code === 200) {
          this.findDataDictionaryList()
        }
      })
    },
    handleSizeChange: function (size) { // 改变每页大小
      this.pageSize = size
    },
    handleCurrentChange: function (currentPage) { // 改变页码
      this.currentPage = currentPage
    },
    getCurrentRow(val) {
      this.currentRow = val
      console.log(this.currentRow)
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
