<template>
    <el-container style="height: 100%; border: 1px solid red;">
        <el-header style="height: 10%; border: 1px solid blue;">
            <h1>个人记账系统</h1>
        </el-header>
        <el-main style="display: flex;justify-content: center;">
            <router-view></router-view>
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
        this.$router.push({name: "billingDetails"})
    },
    methods: {
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
