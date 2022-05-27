<template>
    <el-container style="height: 100%; border: 1px solid red;">
        <el-header style="height: 10%; border: 1px solid blue;">
                        <h1>个人记账系统</h1>
        </el-header>
        <el-main style="display: flex;justify-content: center;">
            <el-timeline :reverse="true"  style="width: 50%">
                <el-timeline-item v-for="item in billingDetailsList" :key="item.id" :timestamp="item.recordTime"
                                  placement="top">
                    <el-card class="box-card" shadow="always">
                        <div slot="header" class="clearfix">
                            <span>{{ item.recordTime }}账单</span>
                            <el-button style="float: right; padding: 3px 0" type="text">账单明细</el-button>
                        </div>
                        <div class="text item"
                             style="display: flex;flex-direction: column;">
                            <div style="display: flex;align-items: center;">
                                <el-tag size="small">{{ item.spendingType }}</el-tag>
                                <span style="margin-left: 5px;font-weight: bold">{{ item.amountPaid }}元</span>
                            </div>
                            <div style="margin-top: 10px;">{{ item.remark }}</div>
                        </div>
                    </el-card>
                </el-timeline-item>
            </el-timeline>
        </el-main>
    </el-container>
</template>

<script>
import {findBillingDetailsList} from "@/api/billingDetails";

export default {
    name: "BillingHome",
    data() {
        return {
            billingDetailsList: []
        }
    },
    created() {
        this.findBillingDetailsList()
    },
    methods: {
        findBillingDetailsList() {
            let data = {}
            let params = {}
            findBillingDetailsList(data,params).then(res =>{
                if (res.code === 200){
                    this.billingDetailsList = res.data.dataList
                }
            })
        }
    }
}
</script>

<style scoped>
.el-header {
    background-color: #66B1FF;
    color: #333;
}

.el-main {
    background-color: #D9ECFF;
    color: #333;
}
</style>
