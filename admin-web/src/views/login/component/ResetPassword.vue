<template>
  <el-dialog
    :visible="dialogVisible"
    :close-on-click-modal="true"
    title="重置密码"
    width="30%"
    @close="handleCloseDialog"
  >
    <el-form ref="form" :model="form" :rules="rules" label-width="100px">
      <el-form-item label="用户名" prop="username">
        <el-input v-model="form.username"/>
      </el-form-item>
      <el-form-item label="密码" prop="password">
        <el-input v-model="form.password"/>
      </el-form-item>
      <el-form-item label="确认密码" prop="confirmPassword">
        <el-input v-model="form.confirmPassword"/>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer" style="text-align: center">
      <el-button type="primary" @click="resetPassword()">确 定</el-button>
      <el-button @click="handleCloseDialog">取 消</el-button>
    </div>
  </el-dialog>
</template>

<script>
import { updatePassword } from '@/api/auth'

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
    const confirmPassword = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请再次填写密码'))
      } else if (value !== this.form.password) {
        callback(new Error('两次输入密码不一致!'))
      } else {
        callback()
      }
    }
    return {
      form: {},
      rules: {
        username: [
          { required: true, message: '请填写用户名', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请填写用户密码', trigger: 'blur' }
        ],
        confirmPassword: [
          { required: true, message: '请再次填写密码', trigger: 'blur' },
          { validator: confirmPassword, trigger: 'blur' }
        ]
      },
      dialogFormVisible: false
    }
  },
  methods: {
    resetPassword() { // 修改个人信息
      this.$refs['form'].validate(valid => {
        if (valid) {
          updatePassword(this.form).then(res => {
            this.$message({ message: res.message, duration: 2000 })
            if (res.code === 200) {
              this.form = {}
              this.handleCloseDialog()
            } else {
              // 处理错误情况
              this.$message.error(res.message || '重置失败，请稍后再试！')
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
