<template>
  <el-button v-waves type="primary" icon="el-icon-edit" @click="$emit('add')">
    新增
  </el-button>
</template>

<script>
import waves from '@/directive/waves'

export default {
  name: 'ButtonAdd',
  directives: { waves }

}
</script>

<style scoped>

</style>
