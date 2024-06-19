<template>
  <div v-show="value" class="image-crop-upload">
    <div class="image-crop-upload-wrap">
      <UploadArea :is-uploading="loading === 1" @fileSelected="handleFileSelected"/>
      <CropArea v-if="step === 2" :source-img-url="sourceImgUrl" @cropComplete="handleCropComplete"/>
      <PreviewArea v-if="step === 3" :preview-image-url="createImgUrl"/>
      <ProgressBar v-if="step === 3 && loading === 1" :progress="progress"/>
      <ErrorDisplay v-if="hasError" :error-msg="errorMsg"/>
    </div>
  </div>
</template>

<script>
import UploadArea from './UploadArea.vue'
import CropArea from './CropArea.vue'
import PreviewArea from './PreviewArea.vue'
import ProgressBar from './ProgressBar.vue'
import ErrorDisplay from './ErrorDisplay.vue'
export default {
  name: 'ImageCropUploadVue',
  props: {

  },
  components: {
    UploadArea,
    CropArea,
    PreviewArea,
    ProgressBar,
    ErrorDisplay
  },
  data(){
    return {
      // 图片的mime
      mime,
      // 语言包
      lang,
      // 浏览器是否支持该控件
      isSupported,
      // 浏览器是否支持触屏事件
      // eslint-disable-next-line no-prototype-builtins
      isSupportTouch: document.hasOwnProperty('ontouchstart'),
      // 步骤
      step: 1, // 1选择文件 2剪裁 3上传
      // 上传状态及进度
      loading: 0 // 0未开始 1正在 2成功 3错误
    }
  }
}
</script>

<style scoped>

</style>
