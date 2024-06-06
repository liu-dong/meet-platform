<template>
  <div class="app-container">
    <div class="top">
      <div style="font-weight: bolder;">用户名</div>
      <div style="color: #20a0ff">{{ username }}</div>
      <div style="font-weight: bolder;">用户类型</div>
      <div style="color: #20a0ff">{{ dataCatalogUtils.getName(userType, userTypeOption) }}</div>
    </div>
    <role-checkbox-group class="middle" :checked.sync="checkedRoles"/>
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
import RoleCheckboxGroup from '@/views/admin/components/RoleCheckboxGroup.vue'

export default {
  name: 'UserRoleDetail',
  components: { RoleCheckboxGroup },
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
      checkedRoles: [] // 选中的角色集合
    }
  },
  computed: {
    dataCatalogUtils() {
      return dataCatalogUtils
    }
  },
  created: async function() {
    this.userTypeOption = await dataCatalogUtils.getData(DataCatalog.userType)
    if (this.userId) {
      this.findUserRoleList(this.userId)
    }
  },
  methods: {
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
