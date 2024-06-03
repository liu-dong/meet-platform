<template>
  <div class="container">
    <div class="top">
      <el-breadcrumb separator-class="el-icon-arrow-right" style="padding-left: 15px;padding-top: 15px;">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>人员管理</el-breadcrumb-item>
        <el-breadcrumb-item>人员列表</el-breadcrumb-item>
      </el-breadcrumb>
      <el-form
          :inline="true"
          :model="person"
          class="demo-form-inline"
          style="padding-left: 15px;padding-bottom: 10px;"
      >
        <el-form-item label="姓名">
          <el-input v-model="person.name" placeholder="人员名称"/>
        </el-form-item>
        <el-form-item label="身份证号">
          <el-input v-model="person.identityCard" placeholder="身份证号"/>
        </el-form-item>
        <el-form-item label="单位名称">
          <el-input v-model="person.orgName" placeholder="单位名称"/>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="findPersonList">查询</el-button>
          <el-button plain type="primary" @click="toDetail">新增</el-button>
          <el-button circle icon="el-icon-delete" type="danger" @click="deleteInfo"/>
        </el-form-item>
      </el-form>
    </div>
    <div class="bottom">
      <el-table
          :data="tableData"
          :default-sort="{prop: 'createTime', order: 'descending'}"
          :header-cell-style="{background:'#303133','text-align':'center'}"
          height="0px"
          highlight-current-row
          @current-change="getCurrentRow"
      >
        <el-table-column align="center" fixed label="序号" type="index"/>
        <el-table-column align="center" label="姓名" prop="name" sortable>
          <template slot-scope="{row}">
            <span style="color: #409EFF;" @click="toDetail(row)">{{ row.name }}</span>
          </template>
        </el-table-column>
        <el-table-column align="center" label="年龄" prop="age" sortable/>
        <el-table-column :formatter="formatSex" align="center" label="性别" prop="sex"/>
        <el-table-column align="center" label="手机" prop="phone"/>
        <el-table-column align="center" label="邮箱" prop="email"/>
        <el-table-column align="left" label="现住址" prop="presentAddress" sortable/>
        <el-table-column align="center" label="创建时间" prop="updateTime"/>
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
import qs from 'qs'
import { deletePerson, findPersonList } from '@/api/person'

export default {
  name: 'PersonList',
  data() {
    return {
      person: {},
      tableData: [],
      currentPage: 1, // 初始页
      pageSize: 10, // 每页的数据
      total: 1000,
      currentRow: {}
    }
  },
  created() {
    this.findPersonList()
  },
  methods: {
    formatSex: function (row) {
      return row.sex === 0 ? '男' : '女'
    },
    // 获取人员信息
    findPersonList: function () {
      let data = {...this.person}
      let params = {
        page: this.currentPage,
        limit: this.pageSize
      }
      findPersonList(data, params).then(res => {
        console.log(res.data)
        if (res.code === 200) {
          this.tableData = res.data.dataList
          this.total = res.data.total
        }
      })
    },
    toDetail: function (row) {
      const id = row.id
      this.$router.push({name: 'personDetail', params: {id: id}})
    },
    deleteInfo: function () {
      const currentRow = this.currentRow
      if (JSON.stringify(currentRow) === '{}') {
        this.$message({message: '请选择要删除的数据', duration: 2000})
        return
      }
      deletePerson(qs.stringify({id: currentRow.id})).then(res => {
        this.$message({message: res.message, duration: 2000})
        if (res.code === 200) {
          this.findPersonList()
        }
      })
    },
    getCurrentRow(val) {
      this.currentRow = val
    },
    // 改变每页大小
    handleSizeChange: function (size) {
      this.pageSize = size
      this.findPersonList()
    },
    // 改变页码
    handleCurrentChange: function (currentPage) {
      this.currentPage = currentPage
      this.findPersonList()
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
  /* display: flex;
   flex-direction: column;
   justify-content: space-between;
   align-items: center;*/
  /*两行居中*/
  box-shadow: 0 12px 24px 0 rgba(28, 31, 33, .1); /*添加阴影*/
}

.top {
  width: 100%;
  height: 20%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.bottom {
  width: 100%;
  height: 80%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
}
</style>
