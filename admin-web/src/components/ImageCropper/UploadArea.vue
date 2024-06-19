<template>
  <div class="upload-area" @click="triggerFileInput">
    <input v-show="false" type="file" ref="fileInput" @change="fileChanged" :disabled="isUploading">
    <!-- 其他UI元素 -->
  </div>
</template>
<script>
export default {
  name: 'UploadArea',
  props: ['isUploading'],
  methods: {
    triggerFileInput() {
      if (!this.isUploading) {
        this.$refs.fileInput.click();
      }
    },
    fileChanged(event) {
      this.$emit('fileSelected', event.target.files[0]);
    }
  }
}
</script>

<style scoped>

</style>
