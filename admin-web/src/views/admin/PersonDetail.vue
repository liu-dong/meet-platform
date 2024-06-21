<template>
  <div class="app-container">
    <el-form
      ref="ruleForm"
      :readonly="viewType==='view'"
      :model="ruleForm"
      :rules="rules"
      label-width="100px"
      class="form"
      label-position="left"
    >
      <el-form-item label="姓名" prop="name">
        <el-input v-model="ruleForm.name" />
      </el-form-item>
      <el-form-item label="性别" prop="sex">
        <el-input v-model="ruleForm.sex" />
      </el-form-item>
      <el-form-item label="身份证号" prop="identityCard">
        <el-input v-model="ruleForm.identityCard" />
      </el-form-item>
      <el-form-item label="年龄" prop="age">
        <el-input v-model="ruleForm.age" />
      </el-form-item>
      <el-form-item label="所属单位" prop="companyId">
        <el-input v-model="ruleForm.companyId" />
      </el-form-item>
      <el-form-item label="手机号" prop="phone">
        <el-input v-model="ruleForm.phone" />
      </el-form-item>
      <el-form-item label="邮箱" prop="email">
        <el-input v-model="ruleForm.email" />
      </el-form-item>
      <el-form-item label="出生日期" prop="birthdate">
        <el-date-picker v-model="ruleForm.birthdate" type="date" placeholder="选择日期" value-format="yyyy-MM-dd" />
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
        <el-input v-model="ruleForm.nativePlace" />
      </el-form-item >
        <el-form-item label="个人简介" style="width: 71%">
          <el-input v-model="ruleForm.individualResume" type="textarea" />
        </el-form-item>
    </el-form>
    <div class="form-button">
      <el-button v-if="viewType!=='view'" type="primary" @click="saveForm('ruleForm')">保存</el-button>
      <el-button @click="goBack()">返回</el-button>
    </div>
  </div>
</template>

<script>
import { codeToText, regionData } from 'element-china-area-data'
import { getPerson, savePerson } from '@/api/person'

export default {
  name: 'PersonDetail',
  data() {
    return {
      viewType: '',
      ruleForm: {},
      rules: {
        name: [
          { required: true, message: '请填写姓名', trigger: 'blur' }
        ],
        identityCard: [
          { required: true, message: '请填写身份证号', trigger: 'blur' }
        ]
      },
      options: regionData,
      selectedOptions: []
    }
  },
  created() {
    const id = this.$route.params.id
    if (id) {
      this.viewType = this.$route.params.viewType
      this.getPerson(id)
    }
  },
  methods: {
    getPerson: function(id) {
      getPerson({ id: id }).then(res => {
        this.$message({ message: res.message, duration: 2000 })
        if (res.code === 200) {
          this.ruleForm = res.data
        }
      })
    },
    saveForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          savePerson(this.ruleForm).then(res => {
            this.$message({ message: res.message, duration: 2000 })
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
        text += codeToText[this.selectedOptions[i]]
      }
      this.ruleForm.presentAddress = text
    }
  }
}
</script>

<style scoped>

</style>
