<template>
    <div class="top">
        <el-breadcrumb separator-class="el-icon-arrow-right" style="padding-left: 15px;padding-top: 15px;">
            <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
            <el-breadcrumb-item>模块管理</el-breadcrumb-item>
            <el-breadcrumb-item>生成代码</el-breadcrumb-item>
        </el-breadcrumb>
    </div>
</template>

<script>
export default {
    name: 'ViewPath',
    data() {
        return {
            module: ''

        }
    }
}
</script>

<style scoped>

</style>
