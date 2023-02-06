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
          ref="form"
          :model="form"
          :rules="rules"
          class="demo-ruleForm el-form"
          label-width="100px"
          style="height: 100%"
      >
        <div class="row">
          <el-form-item label="模块名称">
            <el-select v-model="form.moduleName" style="width:100% !important">
              <el-option value="admin">管理系统</el-option>
              <el-option value="blog">博客系统</el-option>
              <el-option value="shop">购物系统</el-option>
              <el-option value="billing">记账系统</el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="数据类型">
            <el-select v-model="form.dataType" style="width:100% !important">
              <el-option value="string">字符串</el-option>
              <el-option value="hash">哈希</el-option>
              <el-option value="list">列表</el-option>
              <el-option value="set">集合</el-option>
              <el-option value="zset">有序集合</el-option>
            </el-select>
          </el-form-item>
        </div>
        <div class="row">
          <el-form-item label="分类名称" prop="categoryName">
            <el-input v-model="form.categoryName"/>
          </el-form-item>
          <el-form-item label="分类编码" prop="categoryCode">
            <el-input v-model="form.categoryCode"/>
          </el-form-item>
        </div>
        <div class="row" style="height: 40%">
          <div class="property-div">
            <el-link type="primary" @click="addRow">添加行</el-link>
            <div v-for="(item,index) in form.propertyList" :key="index" class="property-row">
              <el-form-item :label="'属性名称'+(index+1)" prop="propertyName">
                <el-input v-model="item.propertyName"/>
              </el-form-item>
              <el-form-item :label="'属性编码'+(index+1)" prop="propertyCode">
                <el-input v-model="item.propertyCode"/>
              </el-form-item>
              <el-button circle icon="el-icon-delete" type="danger" @click="deleteRow(index)"/>
            </div>
          </div>
        </div>
        <div class="row">
          <el-form-item>
            <el-button type="primary" @click="saveForm('form')">保存</el-button>
            <el-button @click="goBack()">返回</el-button>
          </el-form-item>
        </div>
      </el-form>
    </div>
  </div>
</template>

<script>
import {getDataDictionaryInfo, saveDataDictionary} from '@/api/dataDictionary'

export default {
  name: 'DictionaryDetail',
  data() {
    return {
      form: {
        categoryName: '',
        categoryCode: '',
        propertyList: [
          {
            propertyName: '',
            propertyCode: ''
          }
        ],
        status: 1,
        dataType: 'string',
        moduleName: ''
      },
      rules: {
        categoryName: [
          {required: true, message: '请填写属性名称', trigger: 'blur'}
        ],
        categoryCode: [
          {required: true, message: '请填写属性编码', trigger: 'blur'}
        ]
      }
    }
  },
  created() {
    const categoryCode = this.$route.params.categoryCode
    if (categoryCode) {
      this.getDataDictionaryInfo(categoryCode)
    }
  },
  methods: {
    // 添加一行数据
    addRow() {
      this.form.propertyList.push({
        propertyName: '',
        propertyCode: ''
      })
    },
    // 删除一行数据
    deleteRow(index) {
      this.form.propertyList.splice(index, 1)
      console.log('删除：', this.form.propertyList)
    },
    getDataDictionaryInfo(categoryCode) { // 获取菜单信息
      getDataDictionaryInfo({categoryCode: categoryCode}).then(res => {
        console.log(res.data)
        this.$message({message: res.message, duration: 2000})
        if (res.code === 200) {
          this.form = res.data
        }
      })
    },
    saveForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          console.log(this.form)
          saveDataDictionary(this.form).then(res => {
            this.$message({message: res.message, duration: 2000})
            if (res.code === 200) {
              this.form = res.data
            }
          })
        }
        return false
      })
    },
    goBack() {
      this.$router.go(-1)// 返回上一层
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

.property-div {
  width: 100%;
  height: 100%;
  overflow: auto;
  display: flex;
  flex-direction: column;
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
