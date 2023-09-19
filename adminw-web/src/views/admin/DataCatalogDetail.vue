<template>
  <div class="container">
    <div class="top">
      <el-breadcrumb separator-class="el-icon-arrow-right" style="padding-left: 15px;padding-top: 15px;">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>数据字典</el-breadcrumb-item>
        <el-breadcrumb-item>数据字典详情页</el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div class="bottom">
      <el-form
        ref="dataCatalog"
        :model="dataCatalog"
        :rules="rules"
        class="demo-ruleForm el-form"
        label-width="100px"
        style="height: 100%"
      >
        <div class="row">
          <el-form-item label="目录名称" prop="catalogName">
            <el-input v-model="dataCatalog.catalogName" />
          </el-form-item>
          <el-form-item label="目录编码" prop="catalogCode">
            <el-input v-model="dataCatalog.catalogCode" />
          </el-form-item>
          <el-form-item label="状态" prop="status">
            <el-select v-model="dataCatalog.status">
              <el-option label="禁用" :value="0" />
              <el-option label="启用" :value="1" />
            </el-select>
          </el-form-item>
        </div>
        <div class="row">
          <el-form-item label="描述" prop="description" style="width: 100%">
            <el-input v-model="dataCatalog.description" />
          </el-form-item>
        </div>
        <div class="row">
          <el-form-item label="备注" prop="remark" style="width: 100%">
            <el-input v-model="dataCatalog.remark" />
          </el-form-item>
        </div>

        <el-link type="primary" @click="addRow">添加行</el-link>
        <div class="item-div">
          <el-table
            :data="dataCatalog.itemList.filter(item => !item.isDelete || item.isDelete !== 1)"
            :header-cell-style="{background:'rgb(113 167 228)',color:'#fff'}"
            border
            style="width: 100%; cursor: pointer;"
            :row-style="{height: '0'}"
            :cell-style="{padding: '0'}"
          >
            <el-table-column label="序号" type="index" align="center" width="50" />
            <el-table-column prop="sort" align="center" width="80" :required="true" label="排序">
              <template slot-scope="{row,$index}">
                <span v-if="!isEdit[$index]">{{ row.sort }}</span>
                <el-input v-else v-model="dataCatalog.itemList[$index].sort" placeholder="排序" />
              </template>
            </el-table-column>
            <el-table-column prop="itemCode" align="center" width="180" :required="true" label="条目编码">
              <template slot-scope="{row,$index}">
                <span v-if="!isEdit[$index]">{{ row.itemCode }}</span>
                <el-input
                  v-else
                  v-model="dataCatalog.itemList[$index].itemCode"
                  placeholder="请输入条目编码"
                />
              </template>
            </el-table-column>
            <el-table-column prop="itemName" align="center" width="180" :required="true" label="条目名称">
              <template slot-scope="{row,$index}">
                <span v-if="!isEdit[$index]">{{ row.itemName }}</span>
                <el-input
                  v-else
                  v-model="dataCatalog.itemList[$index].itemName"
                  placeholder="请输入条目名称"
                />
              </template>
            </el-table-column>
            <el-table-column prop="remark" align="center" label="备注">
              <template slot-scope="{row,$index}">
                <span v-if="! isEdit[$index]">{{ row.remark }}</span>
                <el-input v-else v-model="dataCatalog.itemList[$index].remark" />
              </template>
            </el-table-column>
            <el-table-column prop="status" align="center" width="150" label="状态">
              <template slot-scope="{row,$index}">
                <el-select
                  v-model="dataCatalog.itemList[$index].status"
                  :aria-disabled="!isEdit[$index]"
                >
                  <el-option label="禁用" :value="0" />
                  <el-option label="启用" :value="1" />
                </el-select>
              </template>
            </el-table-column>
            <el-table-column header-align="center" align="center" width="100" label="操作">
              <template slot-scope="{row,$index}">
                <el-button v-if="!isEdit[$index]" type="text" size="small" @click="edit($index,row)">
                  编辑
                </el-button>
                <!--                <el-button type="text" size="small" style="color: red;">取消</el-button>-->
                <el-button
                  v-if="isEdit[$index]"
                  type="text"
                  size="small"
                  style="color: red;"
                  @click="cancel($index)"
                >取消
                </el-button>
                <el-button type="text" size="small" style="color: red;" @click="deleteItem($index)">
                  删除
                </el-button>
              </template>
            </el-table-column>
          </el-table>
        </div>

        <div class="row">
          <el-form-item>
            <el-button type="primary" @click="saveForm('dataCatalog')">保存</el-button>
            <el-button @click="goBack()">返回</el-button>
          </el-form-item>
        </div>
      </el-form>
    </div>
  </div>
</template>

<script>
import { getDataCatalogDetail } from '@/api/dataCatalog'

export default {
  name: 'DictionaryDetail',
  data() {
    return {
      isEdit: [],
      dataCatalog: {
        id: '',
        catalogName: '',
        catalogCode: '',
        description: '',
        remark: '',
        status: 1,
        itemList: [
          {
            id: '',
            catalogId: '',
            itemCode: '',
            itemName: '',
            sort: 0,
            remark: '',
            status: '',
            isDelete: 0
          }
        ]
      },
      rules: {
        catalogName: [
          { required: true, message: '请填写目录名称', trigger: 'blur' }
        ],
        catalogCode: [
          { required: true, message: '请填写目录编码', trigger: 'blur' }
        ]
      }
    }
  },
  created() {
    const id = this.$route.params.id
    if (id) {
      this.getDataCatalogDetail(id)
    }
  },
  methods: {
    // 添加一行数据
    addRow() {
      this.dataCatalog.itemList.push(
        {
          id: '',
          catalogId: '',
          itemCode: '',
          itemName: '',
          sort: 0,
          remark: '',
          status: '',
          isDelete: 0
        }
      )
    },
    // 删除一行数据
    deleteItem(index) {
      // this.dataCatalog.itemList.splice(index, 1)
      const item = this.dataCatalog.itemList[index]
      item.isDelete = 1
      this.$set(this.dataCatalog.itemList, index, item)
      console.log('删除：', this.dataCatalog.itemList)
    },
    getDataCatalogDetail(id) { // id
      getDataCatalogDetail({ id: id }).then(res => {
        console.log(res.data)
        this.$message({ message: res.message, duration: 2000 })
        if (res.code === 200) {
          this.dataCatalog = res.data
        }
      })
    },
    saveForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          console.log('请求参数：', this.dataCatalog)
          // saveDataCatalog(this.dataCatalog).then(res => {
          //     this.$message({message: res.message, duration: 2000})
          //     if (res.code === 200) {
          //         this.dataCatalog = res.data
          //     }
          // })
        }
        return false
      })
    },
    goBack() {
      this.$router.go(-1)// 返回上一层
    },
    // 点击修改
    edit(index, row) {
      console.log('index')
      this.isEdit[index] = true
      this.$set(this.isEdit, index, true) // 这里要用$set方法，否则页面状态不更新
    },
    // 取消修改
    cancel(index) {
      this.$confirm('取消编辑？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$set(this.isEdit, index, false)
      })
    }
  }
}
</script>

<style scoped>
.container {
  /*border: 1px solid red;*/
  width: 100%;
  height: 100%;
  box-shadow: 0 12px 24px 0 rgba(28, 31, 33, .1); /*添加阴影*/

}

.row {
  width: 100%;
  margin-bottom: 22px;
  display: flex;
  flex-direction: row;
  align-items: center;

}

.item-div {
  width: 100%;
  height: 50%;
  overflow: auto;
  /*display: flex;*/
  /*flex-direction: column;*/
}

.property-row {
  /*border: 1px solid #8c939d;*/
  margin-bottom: 1px;
  display: flex;
  flex-direction: row;
}

.top {
  width: 100%;
  height: 10%;
  /*display: flex;*/
  /*flex-direction: column;*/
  /*justify-content: space-between;*/
}

.bottom {
  width: 100%;
  height: 90%;
  /*居中*/
  display: flex;
  align-items: center;
  justify-content: center;
  /*居中*/
}

.el-form-item {
  margin-bottom: 0;
}

.el-select {

  width: 100% !important;
}
</style>
