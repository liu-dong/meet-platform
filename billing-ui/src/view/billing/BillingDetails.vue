<template>
    <div>
        <el-calendar>
            <template
                slot="dateCell"
                slot-scope="{date, data}">
                <div class="day" @click="dialogTableVisible = true">
                    <div :class="data.isSelected ? 'is-selected' : ''">{{ data.day.split('-')[2] }}</div>
                    <div>
                        <div v-for="item in billingDetailsList" :key="item.id" style="font-size: small">
                            {{ item.spendingType }}：{{ item.amountPaid }}
                        </div>
                    </div>
                </div>
            </template>
        </el-calendar>
        <!-- Table -->
        <el-dialog :visible.sync="dialogTableVisible" title="当日账单明细">
            <el-button @click="dialogFormVisible = true">记账</el-button>
            <el-button type="danger">删除</el-button>
            <el-table :data="billingDetailsList">
                <el-table-column label="记录日期" property="recordTime" width="150"></el-table-column>
                <el-table-column label="支出类型" property="spendingType" width="200"></el-table-column>
                <el-table-column label="支出金额" property="amountPaid"></el-table-column>
                <el-table-column label="备注" property="remark"></el-table-column>
            </el-table>
        </el-dialog>
        <!-- Form -->
        <el-dialog :visible.sync="dialogFormVisible" append-to-body center title="当日账单明细" width="20%">
            <el-form :model="billingDetails" label-width="70px">
                <el-form-item label="记录时间">
                    <el-input v-model="billingDetails.recordTime" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="支出类型">
                    <el-select v-model="billingDetails.spendingType" placeholder="请选择活动区域">
                        <el-option label="餐饮" value="1"></el-option>
                        <el-option label="房租" value="2"></el-option>
                        <el-option label="购物" value="3"></el-option>
                        <el-option label="娱乐" value="4"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="支出金额">
                    <el-input v-model="billingDetails.amountPaid" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="备注">
                    <el-input v-model="billingDetails.remark" autocomplete="off"></el-input>
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="dialogFormVisible = false">取 消</el-button>
                <el-button type="primary" @click="dialogFormVisible = false">确 定</el-button>
            </div>
        </el-dialog>
    </div>
</template>

<script>
export default {
    name: "BillingDetails",
    data() {
        return {
            dialogTableVisible: false,
            dialogFormVisible: false,
            billingDetails: {
                id: "1",
                recordTime: "2022-01-01",
                spendingType: "买菜",
                amountPaid: "21.88",
                remark: "超市买菜"
            },
            billingDetailsList: [
                {
                    id: "1",
                    recordTime: "2022-01-01",
                    spendingType: "买菜",
                    amountPaid: "21.88",
                    remark: "超市买菜"
                }, {
                    id: "2",
                    recordTime: "2022-01-02",
                    spendingType: "买菜",
                    amountPaid: "22.88",
                    remark: "超市买菜"
                }, {
                    id: "3",
                    recordTime: "2022-01-03",
                    spendingType: "买菜",
                    amountPaid: "23.88",
                    remark: "超市买菜"
                }, {
                    id: "4",
                    recordTime: "2022-01-03",
                    spendingType: "买菜",
                    amountPaid: "23.88",
                    remark: "超市买菜"
                }, {
                    id: "5",
                    recordTime: "2022-01-03",
                    spendingType: "买菜",
                    amountPaid: "23.88",
                    remark: "超市买菜"
                }, {
                    id: "6",
                    recordTime: "2022-01-03",
                    spendingType: "买菜",
                    amountPaid: "23.88",
                    remark: "超市买菜"
                }
            ],
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
