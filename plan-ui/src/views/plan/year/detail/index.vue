<template>
  <div>
    <el-dialog
      :title="textMap[dialogStatus]"
      :visible="dialogVisible"
      :close-on-click-modal="true"
      @close="handleCloseDialog"
    >
      <el-form
        ref="dataForm"
        :disabled="dialogStatus==='view'"
        :rules="rules"
        :model="plan"
        label-position="left"
        label-width="100px"
        style="width: 90%; margin-left:5%;"
      >
        <el-form-item v-if="dialogStatus==='view'" label="计划编码" prop="planCode">
          <el-input v-model="plan.planCode" />
        </el-form-item>
        <el-form-item label="计划名称" prop="planName">
          <el-input v-model="plan.planName" />
        </el-form-item>
        <el-form-item label="计划类型" prop="planType">
          <el-select v-model="plan.planType" class="filter-item" placeholder="请选择">
            <el-option v-for="item in planTypeOptions" :key="item.label" :label="item.label" :value="item.value" />
          </el-select>
        </el-form-item>
        <el-form-item label="计划目标" prop="planTarget">
          <el-input v-model="plan.planTarget" :autosize="{ minRows: 2}" type="textarea" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="plan.remark" :autosize="{ minRows: 2}" type="textarea" />
        </el-form-item>
        <el-form-item v-if="dialogStatus==='view'" label="总结" prop="summary">
          <el-input v-model="plan.summary" :autosize="{ minRows: 2}" type="textarea" />
        </el-form-item>
      </el-form>
      <div v-if="dialogStatus !== 'view'" slot="footer" class="dialog-footer">
        <el-button @click="handleCloseDialog">
          取消
        </el-button>
        <el-button type="primary" @click="saveData">
          保存
        </el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { getPlan, savePlan } from '@/api/plan'

export default {
  name: 'PlanDetail',
  props: {
    dialogVisible: {
      type: Boolean,
      required: true
    },
    dialogStatus: {
      type: String,
      required: true
    },
    id: {
      type: String,
      required: false
    }
  },
  data() {
    return {
      plan: {
        id: undefined,
        planCode: 1,
        planName: '',
        planType: 'year',
        planTarget: '',
        planStatus: 1,
        remark: ''
      },
      textMap: {
        update: '编辑',
        create: '新增',
        view: '查看'
      },
      planTypeOptions: [
        { label: '年度计划', value: 'year' },
        { label: '季度计划', value: 'quarter' },
        { label: '月度计划', value: 'month' },
        { label: '周计划', value: 'week' },
        { label: '日计划', value: 'day' }
      ],
      rules: {
        type: [{ required: true, message: 'type is required', trigger: 'change' }],
        timestamp: [{ type: 'date', required: true, message: 'timestamp is required', trigger: 'change' }],
        title: [{ required: true, message: 'title is required', trigger: 'blur' }]
      }
    }
  },
  created() {
    console.log(1)
    debugger
    if (this.id && this.id !== 'create') {
      this.getDetail(this.id)
    }
  },
  methods: {
    getDetail(id) {
      getPlan(id).then(response => {
        console.log(response)
        if (response.code === 200) {
          this.plan = response.data
        }
      })
    },
    saveData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          console.log(this.plan)
          savePlan(this.plan).then((response) => {
            this.dialogVisible = false
            this.$message({
              message: response.message,
              type: 'success',
              duration: 2000
            })
          })
        }
      })
    },
    handleCloseDialog() {
      this.$emit('close-dialog') // 关闭对话框，向父组件发送事件
    }
  }
}
</script>

