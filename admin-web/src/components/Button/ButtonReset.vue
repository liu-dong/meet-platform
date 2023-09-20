<template>
  <el-button v-waves type="primary" icon="el-icon-refresh-left" @click="$emit('reset')">
    重置
  </el-button>
</template>

<script>
import waves from '@/directive/waves'

export default {
  name: 'ButtonReset',
  directives: { waves }

}
</script>

<style scoped>

</style>
