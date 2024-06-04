<template>
  <div class="app-container">
    <div
      style="border: 1px solid #20a0ff;height: 60px;line-height: 60px; font-size: 18px;display: flex; justify-content: space-around;">
      <div style="font-weight: bolder;">用户名</div>
      <div style="color: #20a0ff">{{ username }}</div>
      <div style="font-weight: bolder;">用户类型</div>
      <div style="color: #20a0ff">{{ dataCatalogUtils.getName(userType, userTypeOption) }}</div>
    </div>
    <div style="margin: 20px 0;"/>
    <el-checkbox v-model="checkAll" :indeterminate="isIndeterminate" @change="handleCheckAllChange">全选</el-checkbox>
    <div style="margin: 15px 0;"/>
    <el-checkbox-group v-model="checkedRoles" @change="handleCheckedCitiesChange">
      <el-checkbox v-for="role in roleList" :key="role.roleCode" :label="role.roleCode">
        {{ role.roleName }}
      </el-checkbox>
    </el-checkbox-group>
    <div>
      <el-button type="primary" @click="assignRoles">保存</el-button>
      <el-button @click="goBack()">返回</el-button>
    </div>
  </div>
</template>

<script>
import dataCatalogUtils from '@/utils/dataCatalogUtils'
import DataCatalog from '@/constant/dataCatalog'
import { assignRoles, findUserRoleList } from '@/api/user'
import { findAllRoleListMap } from '@/api/role'

export default {
  name: 'UserRoleDetail',
  props: {
    userId: {
      type: String,
      default: ''
    },
    username: {
      type: String,
      default: ''
    },
    userType: {
      type: Number,
      default: 2
    }
  },
  computed: {
    dataCatalogUtils() {
      return dataCatalogUtils
    }
  },
  data() {
    return {
      checkAll: false,
      isIndeterminate: true,
      userTypeOption: [],
      roleList: [], // 角色集合
      checkedRoles: [] // 选中的角色集合
    }
  },
  async created() {
    debugger
    this.userTypeOption = await dataCatalogUtils.getData(DataCatalog.userType)
    this.findAllRoleListMap()
    if (this.userId) {
      this.findUserRoleList(this.userId)
    }
  },
  methods: {
    // 查询角色信息
    findAllRoleListMap() {
      findAllRoleListMap().then(res => {
        if (res.code === 200) {
          this.roleList = res.data
        }
      })
    },
    // 查询用户已有的角色
    findUserRoleList(userId) {
      findUserRoleList({ userId: userId }).then(res => {
        if (res.code === 200) {
          this.checkedRoles = res.data
        }
      })
    },
    goBack() {
      this.$router.go(-1)// 返回上一层
    },
    handleCheckAllChange(val) {
      this.checkedRoles = val ? this.roleList : []
      this.isIndeterminate = false
    },
    handleCheckedCitiesChange(value) {
      const checkedCount = value.length
      this.checkAll = checkedCount === this.roleList.length
      this.isIndeterminate = checkedCount > 0 && checkedCount < this.roleList.length
    },
    // 分配角色
    assignRoles() {
      console.log('已选角色：', this.checkedRoles)
      if (this.checkedRoles.length === 0) {
        this.$message({ message: '请勾选角色', duration: 2000, type: 'warning' })
        return
      }
      const data = {
        userId: this.userId,
        roleCodes: this.checkedRoles
      }
      assignRoles(data).then(res => {
        if (res.code === 200) {
          this.$message({ message: res.message, duration: 2000 })
          this.goBack()
        }
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
  /*display: flex;*/
  /*flex-direction: column;*/
  /*justify-content: space-between;*/
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

.el-select {
  position: relative;
  font-size: 14px;
  display: inline-block;
  width: 100%;
}
</style>
