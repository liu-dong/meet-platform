<template>
  <el-button v-waves type="danger" icon="el-icon-delete" @click="$emit('delete')">
    删除
  </el-button>
</template>

<script>
import waves from '@/directive/waves'

export default {
  name: 'ButtonDelete',
  directives: { waves }

}
</script>

<style scoped>

</style>
