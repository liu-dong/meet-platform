<template>
  <div class="app-container">
    <div class="top">
      <div style="font-weight: bolder;">用户名</div>
      <div style="color: #20a0ff">{{ username }}</div>
      <div style="font-weight: bolder;">用户类型</div>
      <div style="color: #20a0ff">{{ dataCatalogUtils.getName(userType, userTypeOption) }}</div>
    </div>
    <div class="middle">
      <el-checkbox v-model="checkAll" :indeterminate="isIndeterminate" @change="handleCheckAllChange">全选</el-checkbox>
      <div style="margin: 15px 0;"/>
      <el-checkbox-group v-model="checkedRoles" @change="handleCheckedRolesChange">
        <el-checkbox v-for="role in roleList" :key="role.roleCode" :label="role.roleCode">
          {{ role.roleName }}
        </el-checkbox>
      </el-checkbox-group>
    </div>
    <div class="bottom">
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
  data() {
    return {
      userTypeOption: [],
      roleList: [], // 角色集合
      checkedRoles: [] // 选中的角色集合
    }
  },
  computed: {
    dataCatalogUtils() {
      return dataCatalogUtils
    },
    checkAll() {
      return this.roleList.length === this.checkedRoles.length
    },
    isIndeterminate() {
      return this.checkedRoles.length > 0 && this.checkedRoles.length < this.roleList.length
    }
  },
  created: async function() {
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
          // 根据选中的角色数量来设置isIndeterminate和checkAll的状态
          // if (this.checkedRoles.length > 0) {
          //   // 如果有选中的角色
          //   this.isIndeterminate = this.checkedRoles.length < this.roleList.length
          //   this.checkAll = this.roleList.length === this.checkedRoles.length
          // }
        }
      })
    },
    goBack() {
      this.$router.go(-1)// 返回上一层
    },
    handleCheckAllChange(val) {
      this.checkedRoles = val ? this.roleList.map(item => item.roleCode) : []
      this.isIndeterminate = false
    },
    handleCheckedRolesChange(value) {
      const checkedCount = value.length
      this.checkAll = checkedCount === this.roleList.length
      this.isIndeterminate = checkedCount > 0 && checkedCount < this.roleList.length
    },
    // 分配角色
    assignRoles() {
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
.top {
  width: 100%;
  height: 10%;
  line-height: 60px;
  font-size: 18px;
  display: flex;
  justify-content: space-around;
}

.middle {
  margin: 20px 0;
  padding: 20px;
  min-height: 480px;
}

.bottom {
  width: 100%;
  height: 10%;
  display: flex;
  justify-content: center;
}
</style>
