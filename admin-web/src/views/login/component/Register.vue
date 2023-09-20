<template>
  <el-dialog
    :visible="dialogVisible"
    :close-on-click-modal="true"
    title="注册用户信息"
    width="30%"
    @close="handleCloseDialog"
  >
    <el-form ref="form" :model="form" :rules="rules" class="demo-ruleForm" label-width="100px">
      <el-form-item label="用户名" prop="username">
        <el-input v-model="form.username" />
      </el-form-item>
      <el-form-item label="密码" prop="password">
        <el-input v-model="form.password" />
      </el-form-item>
      <el-form-item label="真实姓名" prop="realName">
        <el-input v-model="form.realName" />
      </el-form-item>
      <el-form-item label="身份证号" prop="identityCard">
        <el-input v-model="form.identityCard" />
      </el-form-item>
      <el-form-item label="用户类型" prop="userType">
        <el-select v-model="form.userType" placeholder="请选择用户类型">
          <el-option
            v-for="item in userTypeO"
            :key="item.propertyCode"
            :label="item.propertyName"
            :value="item.propertyCode-0"
          />
        </el-select>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer" style="text-align: center">
      <el-button type="primary" @click="register()">确 定</el-button>
      <el-button @click="dialogFormVisible = false">取 消</el-button>
    </div>
  </el-dialog>
</template>

<script>

export default {
  name: 'Register',
  props: {
    // 对话框是否可见
    dialogVisible: {
      type: Boolean,
      required: true
    }
  },
  data() {
    return {
      form: {
        userType: 2
      },
      rules: {
        username: [
          { required: true, message: '请填写用户名', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请填写用户密码', trigger: 'blur' }
        ],
        realName: [
          { required: true, message: '请填写真实姓名', trigger: 'blur' }
        ],
        identityCard: [
          { required: true, message: '请填写身份证号', trigger: 'blur' }
        ]
      },
      dialogFormVisible: false,
      userType: []
    }
  },
  created() {
    this.updateKaptcha()
  },
  mounted() {
  },
  methods: {

    register() { // 修改个人信息
      this.$refs['form'].validate(valid => {
        if (valid) {
          register(this.form).then(res => {
            this.$message({ message: res.message, duration: 2000 })
            if (res.code === 200) {
              this.username = res.data.username
              this.password = res.data.password
            }
          })
        } else {
          return false
        }
      })
      this.dialogFormVisible = false
    },
    // 关闭对话框，向父组件发送事件
    handleCloseDialog() {
      this.$emit('close-dialog')
    }
  }
}
</script>

<style scoped>

</style>
