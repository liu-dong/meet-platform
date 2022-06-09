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
      <el-button @click="dialogFormVisible = true">记账</el-button>
      <el-table :data="billingDetailsList" :border="true">
        <el-table-column header-align="center" align="center" label="活动时间" a property="recordTime" width="150"></el-table-column>
        <el-table-column header-align="center" align="center" label="支出类型" property="spendingType" :formatter="formatterType" width="200"></el-table-column>
        <el-table-column header-align="center" align="right" label="支出金额" property="amountPaid"></el-table-column>
        <el-table-column header-align="center" align="left" label="备注" property="remark"></el-table-column>
        <el-table-column
          fixed="right"
          label="操作"
          width="150" header-align="center" align="center">
          <template slot-scope="scope">
            <el-button @click="dialogFormVisible = true" type="text" size="small">查看</el-button>
            <el-button @click="dialogFormVisible = true" type="text" size="small">编辑</el-button>
            <el-button type="text" size="small">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-dialog>
    <!-- Form -->
    <el-dialog :visible.sync="dialogFormVisible" append-to-body center title="当日账单明细" width="25%">
      <el-form :model="billingDetails" :rules="billingDetailsRules" ref="billingDetailsForm" label-width="80px">
        <el-form-item label="记录时间" prop="recordTime">
          <el-date-picker v-model="billingDetails.recordTime" type="datetime" format="yyyy-MM-dd HH:mm:ss" value-format="yyyy-MM-dd HH:mm:ss" placeholder="选择记录时间" style="width: 100%"></el-date-picker>
        </el-form-item>
        <el-form-item label="支出类型" prop="spendingType">
          <el-select v-model="billingDetails.spendingType" placeholder="请选择活动区域" style="width: 100%">
            <el-option v-for="(index,item) in spendingTypeOption" :key="index" :label="item.name" :value="item.value"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="支出金额" prop="amountPaid">
          <el-input v-model="billingDetails.amountPaid" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="billingDetails.remark" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="saveBillingDetails('billingDetailsForm')">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {findBillingListGroup, saveBillingDetails} from "@/api/billingDetails";
import staticData, {getName} from "@/constant/staticData.js";

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
          { validator: validatorAmountPaid, trigger: 'change' }
        ],
      },
      spendingTypeOption: staticData.spendingType
    }
  },
  created() {
    this.findBillingListGroup()
  },
  methods: {
    async findBillingListGroup(){
      let data = {}
      await findBillingListGroup(data).then(res => {
        if (res.code === 200){
          this.billingDetailsGroup = res.data
          console.log('billingDetailsGroup：',this.billingDetailsGroup)
        }
      })
    },
    findBillingDetailsList(date) {
      console.log("date：",date)
      this.dialogTableVisible = true
      this.billingDetailsList = this.billingDetailsGroup[date]
      console.log("list：",this.billingDetailsList)
      this.billingDetails.recordTime = date + ' 00:00:00'
    },
    saveBillingDetails(formName){
      this.$refs[formName].validate((valid) => {
        if (valid) {
          let data = this.billingDetails
           saveBillingDetails(data).then(async res => {
            if (res.code === 200){
              this.$message({message: res.message,type: 'success'});
              this.dialogFormVisible = false
              this.billingDetails = {
                id: "",
                recordTime: '',
                spendingType: 1,
                amountPaid: 0,
                remark: ""
              }
              await this.findBillingListGroup()
              console.log(data.recordTime.slice(0,10))
              await this.findBillingDetailsList(data.recordTime.slice(0,10))
            }else {
              this.$message({message: res.message,type: 'error'});
            }
          })
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    formatterType(row){
      return getName(row.spendingType,this.spendingTypeOption)
    },
    convertName(name){
      return getName(name,this.spendingTypeOption)
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
