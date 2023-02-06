<template>
  <div class="container">
    <div class="top">
      <el-breadcrumb separator-class="el-icon-arrow-right" style="padding-left: 15px;padding-top: 15px;">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>人员管理</el-breadcrumb-item>
        <el-breadcrumb-item>人员信息详情页</el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <el-form ref="ruleForm" :model="ruleForm" :rules="rules" label-width="100px" class="demo-ruleForm el-form">
      <el-form-item label="姓名" prop="name">
        <el-input v-model="ruleForm.name"/>
      </el-form-item>
      <el-form-item label="性别" prop="sex">
        <el-input v-model="ruleForm.sex"/>
      </el-form-item>
      <el-form-item label="身份证号" prop="identityCard">
        <el-input v-model="ruleForm.identityCard"/>
      </el-form-item>
      <el-form-item label="年龄" prop="age">
        <el-input v-model="ruleForm.age"/>
      </el-form-item>
      <el-form-item label="所属单位" prop="companyId">
        <el-input v-model="ruleForm.companyId"/>
      </el-form-item>
      <el-form-item label="手机号" prop="phone">
        <el-input v-model="ruleForm.phone"/>
      </el-form-item>
      <el-form-item label="邮箱" prop="email">
        <el-input v-model="ruleForm.email"/>
      </el-form-item>
      <el-form-item label="出生日期" prop="birthdate">
        <el-date-picker v-model="ruleForm.birthdate" type="date" placeholder="选择日期" value-format="yyyy-MM-dd"/>
      </el-form-item>
      <el-form-item label="现住址" prop="presentAddress">
        <el-cascader
            v-model="selectedOptions"
            size="large"
            :options="options"
            separator=""
            @change="handleChange"
        />
        <!--                <el-input v-model="ruleForm.presentAddress"></el-input>-->
      </el-form-item>
      <el-form-item label="籍贯" prop="nativePlace">
        <el-input v-model="ruleForm.nativePlace"/>
      </el-form-item>
      <div class="row">
        <el-form-item label="个人简介">
          <el-input v-model="ruleForm.individualResume" type="textarea"/>
        </el-form-item>
      </div>
      <div class="row">
        <el-form-item>
          <el-button type="primary" @click="saveForm('ruleForm')">保存</el-button>
          <el-button @click="goBack()">返回</el-button>
        </el-form-item>
      </div>
    </el-form>
  </div>
</template>

<script>
import {CodeToText, regionData} from 'element-china-area-data'
import {getPersonInfo, savePersonInfo} from '@/api/person'

export default {
  name: 'PersonDetail',
  data() {
    return {
      ruleForm: {},
      rules: {
        name: [
          {required: true, message: '请填写姓名', trigger: 'blur'}
        ],
        identityCard: [
          {required: true, message: '请填写身份证号', trigger: 'blur'}
        ]
      },
      options: regionData,
      selectedOptions: []
    }
  },
  created() {
    const id = this.$route.params.id
    if (id) {
      this.getPersonInfo(id)
    }
  },
  methods: {
    getPersonInfo: function (id) {
      getPersonInfo({id: id}).then(res => {
        this.$message({message: res.message, duration: 2000})
        if (res.code === 200) {
          this.ruleForm = res.data
        }
      })
    },
    saveForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          savePersonInfo(this.ruleForm).then(res => {
            this.$message({message: res.message, duration: 2000})
            if (res.code === 200) {
              this.ruleForm = res.data
            }
          })
        }
        return false
      })
    },
    goBack() {
      this.$router.go(-1)// 返回上一层
    },
    handleChange() {
      let text = ''
      console.log(this.selectedOptions)
      for (let i = 0; i < this.selectedOptions.length; i++) {
        text += CodeToText[this.selectedOptions[i]]
      }
      this.ruleForm.presentAddress = text
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

.el-form {
  /*border: 1px solid red;*/
  padding: 20px 20%;
  overflow: auto;
  display: flex;
  /*flex-direction: row;*/
  /*flex-wrap: wrap;*/
  flex-flow: row wrap;
  justify-content: center;
  align-content: center;

}

.row {
  width: 80%;
  margin-bottom: 22px;
}

.top {
  width: 100%;
  height: 10%;
  /*display: flex;*/
  /*flex-direction: column;*/
  /*justify-content: space-between;*/
}
</style>
