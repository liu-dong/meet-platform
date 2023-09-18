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
        :disabled="dialogStatus==='view' || dialogStatus==='summary'"
        :rules="rules"
        :model="plan"
        label-position="left"
        label-width="100px"
        style="width: 90%; margin-left:5%;"
      >
        <el-form-item v-if="dialogStatus==='view' || dialogStatus==='summary'" label="计划编码" prop="planCode">
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
      </el-form>
      <el-form
        v-if="dialogStatus==='view' || dialogStatus==='summary'"
        ref="summaryForm"
        :disabled="dialogStatus==='view'"
        :rules="rules"
        :model="plan"
        label-position="left"
        label-width="100px"
        style="width: 90%; margin-left:5%;"
      >
        <el-form-item label="总结" prop="summary">
          <el-input v-model="plan.summary" :autosize="{ minRows: 2}" type="textarea" />
        </el-form-item>
      </el-form>
      <div v-if="dialogStatus !== 'view'" slot="footer" class="dialog-footer">
        <el-button @click="handleCloseDialog">
          取消
        </el-button>
        <el-button v-if="dialogStatus==='summary'" type="primary" @click="saveData">
          总结
        </el-button>
        <el-button v-else type="primary" @click="saveData">
          保存
        </el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { getPlan, savePlan, summary } from '@/api/plan'
import { textMap } from '@/constant/common'
import { planTypeOptions } from '@/constant/plan'

export default {
  name: 'PlanDetail',
  props: {
    // 对话框是否可见
    dialogVisible: {
      type: Boolean,
      required: true
    },
    // 对话框状态：create、update、view
    dialogStatus: {
      type: String,
      required: true
    },
    // 主键id
    id: {
      type: String,
      required: true
    }
  },
  data() {
    return {
      plan: {
        id: undefined,
        planName: '',
        planType: 'year',
        planTarget: '',
        remark: ''
      },
      textMap: {
        ...textMap,
        summary: '总结'
      },
      planTypeOptions: planTypeOptions,
      rules: {
        planName: [{ required: true, message: '计划名称不能为空', trigger: 'blur' }],
        planType: [{ required: true, message: '请选择计划类型', trigger: 'change' }],
        planTarget: [{ required: true, message: '计划目标不能为空', trigger: 'blur' }]
      }
    }
  },
  created() {
    if (this.id && this.id !== 'create') {
      this.getDetail(this.id)
    }
  },
  methods: {
    // 查询详情
    getDetail(id) {
      getPlan(id).then(response => {
        console.log(response)
        if (response.code === 200) {
          this.plan = response.data
        }
      })
    },
    // 保存
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
    // 总结
    summary() {
      this.$refs['summaryForm'].validate((valid) => {
        if (valid) {
          console.log(this.plan)
          const param = {
            id: this.id,
            summary: this.plan.summary
          }
          summary(param).then((response) => {
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
    // 关闭对话框，向父组件发送事件
    handleCloseDialog() {
      this.$emit('close-dialog')
    }
  }
}
</script>

