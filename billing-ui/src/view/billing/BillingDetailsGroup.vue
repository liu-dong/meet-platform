<template>
  <div>
    <el-calendar>
      <template
        slot="dateCell"
        slot-scope="{date, data}">
        <div class="day" @click="findBillingDetailsList(data.day)">
          <div :class="data.isSelected ? 'is-selected' : ''">{{ data.day.split('-')[2] }}</div>
          <div>
            <div v-for="item in billingDetailsGroup[data.day]" :key="item.id" style="font-size: small">
              <span style="font-weight: bold;">{{ convertName(item.spendingType) }}：</span>
              <span style="color: red">{{ item.amountPaid }}</span>
            </div>
          </div>
        </div>
      </template>
    </el-calendar>
    <!-- Table -->
    <el-dialog :visible.sync="dialogTableVisible" title="当日账单明细">
      <el-button @click="charge">记账</el-button>
      <el-table :border="true" :data="billingDetailsList">
        <el-table-column a align="center" header-align="center" label="记录时间" property="recordTime"
                         width="150"></el-table-column>
        <el-table-column :formatter="formatterType" align="center" header-align="center" label="支出类型"
                         property="spendingType" width="200"></el-table-column>
        <el-table-column align="right" header-align="center" label="支出金额"
                         property="amountPaid"></el-table-column>
        <el-table-column align="left" header-align="center" label="备注" property="remark"></el-table-column>
        <el-table-column
          align="center"
          fixed="right"
          header-align="center" label="操作" width="150">
          <template slot-scope="scope">
            <el-button size="small" type="text" @click="loadBillingDetails(scope.row,'detail')">查看
            </el-button>
            <el-button size="small" type="text" @click="loadBillingDetails(scope.row,'edit')">编辑</el-button>
            <el-button size="small" type="text" @click="deleteBillingDetails(scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-dialog>
    <!-- Form -->
    <el-dialog :visible.sync="dialogFormVisible" append-to-body center title="当日账单明细" width="25%">
      <el-form ref="billingDetailsForm" :model="billingDetails" :rules="billingDetailsRules" label-width="80px">
        <el-form-item label="记录时间" prop="recordTime">
          <el-date-picker v-model="billingDetails.recordTime" :disabled="viewType==='detail'"
                          format="yyyy-MM-dd HH:mm:ss"
                          placeholder="选择记录时间"
                          style="width: 100%" type="datetime"
                          value-format="yyyy-MM-dd HH:mm:ss"></el-date-picker>
        </el-form-item>
        <el-form-item label="支出类型" prop="spendingType">
          <el-select v-model="billingDetails.spendingType" :disabled="viewType==='detail'"
                     placeholder="请选择活动区域" style="width: 100%">
            <el-option v-for="(item,index) in spendingTypeOption" :key="index" :label="item.name"
                       :value="item.value"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="支出金额" prop="amountPaid">
          <el-input v-model="billingDetails.amountPaid" :disabled="viewType==='detail'"
                    autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="billingDetails.remark" :disabled="viewType==='detail'"
                    autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button v-if="viewType!=='detail'" type="primary" @click="saveBillingDetails('billingDetailsForm')">确 定
        </el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {deleteBillingDetails, findBillingListGroup, getBillingDetails, saveBillingDetails} from "@/api/billingDetails";
import {getCurrentTime} from "@/utils/datetime";
import staticData from "@/utils/staticData";

export default {
  name: "BillingDetailsGroup",
  data() {
    // 校验规则
    let validatorAmountPaid = (rule, value, callback) => {
      if (!value) return callback(new Error('请输入金额'))
      if (!Number(value)) return callback(new Error('请输入数字值'))
      //小数限制0-2位
      let reg = /((^[1-9]\d*)|^0)(\.\d{0,2})?$/;
      if (!reg.test(value)) return callback(new Error('请输入正确金额,精确度为小数点后两位'));
      callback();
    }
    return {
      dialogTableVisible: false,
      dialogFormVisible: false,
      billingDetailsGroup: {},
      billingDetails: {
        id: "",
        recordTime: '',
        spendingType: 1,
        amountPaid: 0,
        remark: ""
      },
      billingDetailsList: [],
      billingDetailsRules: {
        amountPaid: [
          {validator: validatorAmountPaid, trigger: 'change'}
        ],
      },
      spendingTypeOption: [],
      viewType: 'add',//页面类型 add：新增，edit：编辑，detail：查看
      selectDate: '',
    }
  },
  created() {
    this.findBillingListGroup()
    this.spendingTypeOption = staticData.getData('spendingType');
  },
  methods: {
    async findBillingListGroup() {
      let data = {}
      await findBillingListGroup(data).then(res => {
        if (res.code === 200) {
          this.billingDetailsGroup = res.data
        }
      })
    },
    findBillingDetailsList(date) {
      this.dialogTableVisible = true
      this.selectDate = date
      this.billingDetailsList = this.billingDetailsGroup[date]
    },
    saveBillingDetails(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          let data = this.billingDetails
          saveBillingDetails(data).then(async res => {
            if (res.code === 200) {
              this.$message({message: res.message, type: 'success'});
              this.dialogFormVisible = false
              await this.findBillingListGroup()
              await this.findBillingDetailsList(this.selectDate)
            } else {
              this.$message({message: res.message, type: 'error'});
            }
          })
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    loadBillingDetails(row, operationType) {
      let params = {id: row.id}
      getBillingDetails(params).then(async res => {
        this.$message({
          customClass: 'message-z-index',
          message: res.message,
          type: 'success',
          duration: 1000
        });
        if (res.code === 200) {
          this.billingDetails = res.data
          this.viewType = operationType
          this.dialogFormVisible = true
        }
      })
    },
    deleteBillingDetails(row) {
      let params = {id: row.id}
      deleteBillingDetails(params).then(async res => {
        if (res.code === 200) {
          this.$message.success(res.message);
          await this.findBillingListGroup()
          await this.findBillingDetailsList(row.recordTime.slice(0, 10))
        }
      })
    },
    charge() {
      this.dialogFormVisible = true
      this.resetBillingDetails()
      this.billingDetails.recordTime = this.selectDate + " " + getCurrentTime()
      this.viewType = "add"
    },
    resetBillingDetails() {
      this.billingDetails = {
        id: "",
        recordTime: '',
        spendingType: 1,
        amountPaid: 0,
        remark: ""
      }
    },
    formatterType(row) {
      return staticData.getName(row.spendingType, this.spendingTypeOption)
    },
    convertName(name) {
      return staticData.getName(name, this.spendingTypeOption)
    }
  }
}
</script>

<style scoped>
.day {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  height: 100%;
  display: flex;
  justify-content: space-between;
}

</style>
<style>
.message-z-index {
  z-index: 3000 !important;
}
</style>

