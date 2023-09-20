<template>
  <el-button v-waves type="primary" icon="el-icon-search" @click="$emit('search')">
    查询
  </el-button>
</template>

<script>
import waves from '@/directive/waves'

export default {
  name: 'ButtonSearch',
  directives: { waves }

}
</script>

<style scoped>

</style>
