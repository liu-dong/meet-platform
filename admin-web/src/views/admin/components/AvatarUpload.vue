<template>
  <div class="components-container">
    <thumb-image :image="imageUrl"/>
    <el-button type="primary" icon="el-icon-upload" class="change-avatar" @click="imageCropperShow=true">
      更换头像
    </el-button>
    <image-cropper
      v-show="imageCropperShow"
      :key="imageCropperKey"
      :width="300"
      :height="300"
      url="/local/file/upload/second"
      lang-type="zh"
      @close="close"
      @crop-upload-success="cropSuccess"
    />
  </div>
</template>

<script>
import ImageCropper from '@/components/ImageCropper'
import ThumbImage from '@/components/ThumbImage'

export default {
  name: 'AvatarUpload',
  components: { ImageCropper, ThumbImage },
  props: {
    image: {
      type: String,
      default: 'https://wpimg.wallstcn.com/577965b9-bb9e-4e02-9f0c-095b41417191'
    }
  },
  data() {
    return {
      imageCropperShow: false,
      imageCropperKey: 0
    }
  },
  computed: {
    imageUrl() {
      if (this.image && !this.image.includes('https')) {
        return process.env.VUE_APP_IMAGE_PATH + this.image
      } else {
        return 'https://wpimg.wallstcn.com/577965b9-bb9e-4e02-9f0c-095b41417191'
      }
    }
  },
  methods: {
    cropSuccess(resData) {
      console.log('返回结果：', resData)
      this.imageCropperShow = false
      this.imageCropperKey = this.imageCropperKey + 1
      this.image = resData.data.newFileName
      this.$emit('update:image', resData.data.newFileName)
    },
    close() {
      this.imageCropperShow = false
    }
  }
}
</script>

<style scoped>
.components-container {
  display: flex;
  flex-direction: column;
  align-content: space-around;
  align-items: center;
}

.change-avatar {
  margin-top: 20px;
}
</style>

