<template>
  <div class="app-container">
    <el-form ref="ruleForm" :model="ruleForm" class="form" label-width="100px">
      <el-form-item label="单位名称" prop="orgName">
        <el-input v-model="ruleForm.orgName" :disabled="true" />
      </el-form-item>
      <el-form-item label="单位编码" prop="orgCode">
        <el-input v-model="ruleForm.orgCode" :disabled="true" />
      </el-form-item>
      <el-form-item prop="personList" style="width: 70%;height: 65%; overflow: auto">
        <el-table
          ref="multipleTable"
          :data="personList"
          style="width: 100%"
          tooltip-effect="dark"
          @selection-change="selectPersonList"
        >
          <el-table-column align="center" type="selection" width="55" />
          <el-table-column align="center" label="姓名" prop="name">
            <template slot-scope="{row}">
              <span style="color: #409EFF;" @click="toPersonDetail(row)">{{ row.name }}</span>
            </template>
          </el-table-column>
          <el-table-column align="center" label="年龄" prop="age" />
          <el-table-column align="center" label="性别" prop="sex" />
          <el-table-column align="center" label="手机" prop="phone" />
          <el-table-column align="center" label="邮箱" prop="email" />
        </el-table>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="addPerson()">保存</el-button>
        <el-button @click="goBack()">返回</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>

import { addPerson, findOrgPersonList, getOrg } from '@/api/org'
import { findPersonList } from '@/api/person'

export default {
  name: 'OrgPersonDetail',
  data() {
    return {
      ruleForm: {},
      personList: [], // 人员信息列表
      personIds: [] // 选中人员id集合
    }
  },
  async created() {
    await this.findPersonList()
    const orgId = this.$route.params.id
    if (orgId) {
      this.getOrg(orgId)
      await this.findOrgPersonList(orgId)
    }
  },
  mounted() {

  },
  methods: {
    toPersonDetail: function(row) {
      const id = row.id
      alert(id)
      this.$router.push({ name: 'PersonDetail', params: { id: id }})
    },
    goBack() {
      this.$router.go(-1)// 返回上一层
    },
    // 回显选中的人员
    toggleSelection() {
      // 选中人员的列表参数集合
      const selectionPersonList = this.personList.filter(item => {
        return this.personIds.includes(item.id)
      })
      // 回显已选择的人员（toggleRowSelection方法的row数据必须是从tableData中获取）
      if (selectionPersonList) {
        selectionPersonList.forEach(row => {
          this.$refs.multipleTable.toggleRowSelection(row)
        })
      } else {
        this.$refs.multipleTable.clearSelection()
      }
    },
    selectPersonList(val) {
      console.log('选中的人员：', val)
      if (val) {
        this.personIds = val.map(item => {
          return item.id
        })
      }
      console.log(this.personIds)
    },
    // 查询单位信息
    getOrg: function(id) {
      getOrg({ id: id }).then(res => {
        this.$message({ message: res.message, duration: 2000 })
        if (res.code === 200) {
          this.ruleForm = res.data
        }
      })
    },
    // 查询人员列表
    findPersonList: async function() {
      await findPersonList({}).then(res => {
        if (res.code === 200) {
          this.personList = res.data.dataList
        }
      })
    },
    // 查询当前单位所属人员列表
    findOrgPersonList: async function(orgId) {
      const param = { orgId: orgId }
      await findOrgPersonList(param).then(res => {
        if (res.code === 200) {
          // 选中人员的id集合
          this.personIds = res.data.map(item => {
            return item.id
          })
        }
      })
      this.toggleSelection()
    },
    // 添加人员
    addPerson: function() {
      const data = {
        id: this.ruleForm.id,
        personIds: this.personIds
      }
      addPerson(data).then(res => {
        this.$message({ message: res.message, duration: 2000 })
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
