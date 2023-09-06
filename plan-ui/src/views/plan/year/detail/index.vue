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
      <el-button type="primary" @click="dialogStatus==='create'?createData():updateData()">
        保存
      </el-button>
    </div>
  </div>
</template>

<script>
import { createArticle, updateArticle } from '@/api/article'

export default {
  name: 'PlanDetail',
  data() {
    return {
      tableKey: 0,
      list: null,
      total: 0,
      importanceOptions: [1, 2, 3],
      statusOptions: ['published', 'draft', 'deleted'],
      showReviewer: false,
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
      dialogPvVisible: false,
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
      },
      downloadLoading: false
    }
  },
  created() {
    this.getList()
  },
  methods: {
    createData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          this.plan.id = parseInt(Math.random() * 100) + 1024 // mock a id
          this.plan.author = 'vue-element-admin'
          createArticle(this.plan).then(() => {
            this.list.unshift(this.plan)
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
    },
    updateData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          const tempData = Object.assign({}, this.plan)
          tempData.timestamp = +new Date(tempData.timestamp) // change Thu Nov 30 2017 16:41:05 GMT+0800 (CST) to 1512031311464
          updateArticle(tempData).then(() => {
            const index = this.list.findIndex(v => v.id === this.plan.id)
            this.list.splice(index, 1, this.plan)
            this.dialogFormVisible = false
            this.$notify({
              title: 'Success',
              message: 'Update Successfully',
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

