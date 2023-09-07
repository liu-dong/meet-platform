<template>
  <div>
    <el-form
      ref="dataForm"
      :rules="rules"
      :model="plan"
      label-position="left"
      label-width="100px"
      style="width: 90%; margin-left:5%;"
    >
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
    <div slot="footer" class="dialog-footer">
      <el-button @click="this.$emit('close', dialogFormVisible = false)">
        取消
      </el-button>
      <el-button type="primary" @click="dialogStatus===saveData">
        保存
      </el-button>
    </div>
  </div>
</template>

<script>
import { savePlan } from '@/api/plan'

export default {
  name: 'PlanDetail',
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
      dialogFormVisible: false,
      dialogStatus: '',
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
    this.getList()
  },
  methods: {
    saveData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          this.plan.author = 'vue-element-admin'
          savePlan(this.plan).then(() => {
            this.dialogFormVisible = false
            this.$notify({
              title: 'Success',
              message: 'Created Successfully',
              type: 'success',
              duration: 2000
            })
          })
        }
      })
    }
  }
}
</script>

