<template>
  <div class="app-container">
    <el-form ref="ruleForm" :model="ruleForm" :rules="rules" class="form" label-width="100px">
      <el-form-item label="单位名称" prop="orgName" style="width: 70%;">
        <el-input v-model="ruleForm.orgName" />
      </el-form-item>
      <el-form-item label="单位类型" prop="orgType">
        <el-select v-model="ruleForm.orgType" placeholder="请选择单位类型">
          <el-option :value="1" label="商家单位" />
        </el-select>
      </el-form-item>
      <el-form-item label="单位编码" prop="orgCode">
        <el-input v-model="ruleForm.orgCode" />
      </el-form-item>
      <el-form-item label="单位地址" prop="orgDivisionCode" style="width: 70%;">
        <el-cascader
          :key="modalKey"
          ref="cascaderDivision"
          v-model="divisionCodes"
          :props="divisionProps"
          separator=""
          style="width: 100%"
          @change="setOrgAddress"
        />
      </el-form-item>
      <el-form-item label="详细地址" prop="orgAddress" style="width: 70%;">
        <el-input v-model="ruleForm.orgAddress" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="saveForm('ruleForm')">保存</el-button>
        <el-button @click="goBack()">返回</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import { findProvinceList, findSubordinateDivisionList } from '@/api/common'
import { getOrg, saveOrg } from '@/api/org'

export default {
  name: 'OrgDetail',
  data() {
    return {
      ruleForm: {
        orgName: '',
        orgCode: '',
        orgType: '',
        orgDivisionCode: '',
        orgAddress: ''
      },
      rules: {
        orgName: [
          { required: true, message: '请填写单位名称', trigger: 'blur' }
        ],
        orgCode: [
          { required: true, message: '请填写单位编码', trigger: 'blur' }
        ]
      },
      divisionCodes: [], // 区划
      divisionProps: {
        lazy: true,
        lazyLoad: this.lazyLoadDivision,
        emitPath: false
      },
      modalKey: 0
    }
  },
  created() {
    const id = this.$route.params.id
    if (id) {
      this.getOrg(id)
    }
  },
  mounted() {

  },
  methods: {
    // 查询单位信息
    getOrg: function(id) {
      getOrg({ id: id }).then(res => {
        this.$message({ message: res.message, duration: 2000 })
        if (res.code === 200) {
          this.ruleForm = res.data
          // this.findOrgAccountList(this.ruleForm.orgCode)
          this.setDivisionCodes(this.ruleForm.orgDivisionCode)
        }
      })
    },
    // 查询单位下所属账号信息
    /* findOrgAccountList(orgCode) {
         findOrgAccountList({ orgCode: orgCode }).then(res => {
             if (res.code === 200) {
                 if (res.data && res.data.length > 0) {
                     this.orgAccount.accountIdList = res.data.map(item => item.id)
                 }
             }
         })
     },*/
    saveForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          saveOrg(this.ruleForm).then(res => {
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
    // 设置单位地址
    setOrgAddress(value) {
      this.ruleForm.orgDivisionCode = value// 取最后一级
      const pathLabels = this.$refs['cascaderDivision'].getCheckedNodes()[0].pathLabels
      this.ruleForm.orgAddress = pathLabels.join('')// 取省市区全路径
    },
    // 设置行政区划回显
    setDivisionCodes(divisionCode) {
      if (divisionCode) {
        this.divisionCodes = [divisionCode.substring(0, 2) + '0000', divisionCode.substring(0, 4) + '00', divisionCode]
        this.modalKey++
      }
    },
    // 懒加载级联区划
    lazyLoadDivision(node, resolve) {
      const { level } = node
      if (level === 0) {
        findProvinceList({}).then(res => {
          if (res.code === 200) {
            const divisionList = res.data
            const nodes = divisionList.map(item => ({
              label: item.divisionName,
              value: item.divisionCode,
              leaf: level >= 2

            }))
            resolve(nodes)
          }
        })
      }
      if (level > 0) {
        findSubordinateDivisionList({ parentCode: node.value }).then(res => {
          if (res.code === 200) {
            const divisionList = res.data
            const nodes = divisionList.map(item => ({
              label: item.divisionName,
              value: item.divisionCode,
              leaf: level >= 2

            }))
            resolve(nodes)
          }
        })
      }
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

.top {
  width: 100%;
  height: 10%;
}

.bottom {
  width: 100%;
  height: 90%;
}

.form {
  width: 100%;
  height: 100%;
  display: flex;
  flex-flow: row wrap;
  justify-content: center;
  align-items: flex-start;
}

.el-form-item {
  width: 35%;
  margin-bottom: 0;
}

/*控制穿梭框左右模块*/
.el-transfer-panel {
  width: 35%;
}

/*控制穿梭框按钮模块*/
.el-transfer__buttons {
  padding: 0;
}
</style>
