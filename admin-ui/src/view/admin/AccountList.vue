<template>
  <div class="container">
    <div class="top">
      <el-breadcrumb separator-class="el-icon-arrow-right" style="padding-left: 15px;padding-top: 15px;">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>账号管理</el-breadcrumb-item>
        <el-breadcrumb-item>账号列表</el-breadcrumb-item>
      </el-breadcrumb>
      <el-form
          :inline="true"
          :model="accountInfo"
          class="demo-form-inline"
          style="padding-left: 15px;padding-bottom: 10px;"
      >
        <el-form-item label="用户名">
          <el-input v-model="accountInfo.username" placeholder="用户名"/>
        </el-form-item>
        <el-form-item>
          <el-button round type="primary" @click="findAccountList">查询</el-button>
          <el-button plain type="primary" @click="toDetail">新增</el-button>
          <el-button plain type="primary" @click="deleteInfo">删除</el-button>
        </el-form-item>
      </el-form>
    </div>
    <div class="bottom">
      <el-table
          :data="tableData.slice((currentPage-1) * pageSize, currentPage * pageSize)"
          :default-sort="{prop: 'userType', order: 'ascending'}"
          :header-cell-style="{background:'#303133','text-align':'center'}"
          height="0px"
          highlight-current-row
          @current-change="getCurrentRow"
      >
        <!--                <el-table-column type="selection" width="50" align="center"/>--><!--多选-->
        <el-table-column align="center" label="序号" prop="" type="index"/>
        <el-table-column align="center" label="用户名" prop="username" sortable>
          <template slot-scope="{row}">
            <span style="color: #409EFF;" @click="toDetail(row)">{{ row.username }}</span>
          </template>
        </el-table-column>
        <el-table-column align="center" label="真实姓名" prop="realName" sortable>
          <template slot-scope="{row}">
            <span style="color: #409EFF;" @click="toPersonDetail(row)">{{ row.realName }}</span>
          </template>
        </el-table-column>
        <el-table-column :formatter="formatType" align="center" label="用户类型" prop="userType" sortable/>
        <el-table-column align="center" label="上次登录时间" prop="lastLoginTime" sortable/>
        <el-table-column align="center" label="登录次数" prop="loginCount" sortable/>
        <el-table-column :formatter="formatStatus" align="center" label="状态" prop="userStatus" sortable/>
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
import qs from 'qs'
import {deleteAccountInfo, findAccountInfoList} from '@/api/account'
import dataCatalogUtils from "@/util/dataCatalogUtils";
import DataCatalog from "@/constant/dataCatalog";

export default {
  name: 'AccountList',
  data() {
    return {
      accountInfo: {},
      tableData: [],
      currentPage: 1, // 初始页
      pageSize: 10, // 每页的数据
      total: 1000,
      currentRow: {},
      userTypeOption: []
    }
  },
  async created() {
    this.userTypeOption = await dataCatalogUtils.getData(DataCatalog.userType);
    this.findAccountList()
  },
  methods: {
    formatStatus: function (row) {
      return row.userStatus === 0 ? '正常' : '已注销'
    },
    formatType: function (row) {
      return dataCatalogUtils.getName(row.userType, this.userTypeOption)
    },
    findAccountList: function () {

      findAccountInfoList({}).then(res => {
        if (res.code === 200) {
          this.tableData = res.data.dataList
          this.total = res.data.total
        }
      })
    },
    toDetail: function (row) {
      const id = row.id
      this.$router.push({name: 'accountDetail', params: {id: id}})
    },
    toPersonDetail: function (row) {
      const id = row.personId
      alert(id)
      this.$router.push({name: 'personDetail', params: {id: id}})
    },
    deleteInfo: function () {
      const currentRow = this.currentRow
      if (JSON.stringify(currentRow) === '{}') {
        alert('请选择要删除的数据')
      }
      deleteAccountInfo(qs.stringify({id: currentRow.id})).then(res => {
        console.log(res.data)
        this.$message({message: res.message, duration: 2000})
        if (res.code === 200) {
          this.findAccountList()
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
