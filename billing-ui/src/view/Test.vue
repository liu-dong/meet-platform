<template>
  <div style="display: flex;flex-flow: column">
    <!--开启摄像头-->
    <img :src="headImgSrc" alt="摄像头" height="480" width="640" @click="callCamera">
    <!--图片展示-->
    <video ref="video" autoplay height="480" width="640" style="border: 1px solid red"></video>
    <!--canvas截取流-->
    <canvas ref="canvas" height="480" width="640" style="border: 1px solid rebeccapurple"></canvas>
    <!--确认-->
    <el-button size="mini" type="primary" @click="photograph">拍照</el-button>
  </div>
</template>

<script>
export default {
  name: "Test",
  data() {
    return {
      headImgSrc: require('../../public/meet-2.png')
    }
  },
  methods: {
    // 调用摄像头
    callCamera() {
      // H5调用电脑摄像头API
      navigator.mediaDevices.getUserMedia({
        video: true
      }).then(success => {
        // 摄像头开启成功
        this.$refs['video'].srcObject = success
        // 实时拍照效果
        this.$refs['video'].play()
      }).catch(error => {
        console.error('摄像头开启失败，请检查摄像头是否可用！')
      })
    },
    // 拍照
    photograph() {
      let ctx = this.$refs['canvas'].getContext('2d')
      // 把当前视频帧内容渲染到canvas上
      ctx.drawImage(this.$refs['video'], 0, 0, 640, 480)
      // 转base64格式、图片格式转换、图片质量压缩
      let imgBase64 = this.$refs['canvas'].toDataURL('image/jpeg', 0.7)
      // 由字节转换为KB 判断大小
      let str = imgBase64.replace('data:image/jpeg;base64,', '')
      let strLength = str.length
      let fileLength = parseInt(strLength - (strLength / 8) * 2)
      // 图片尺寸  用于判断
      let size = (fileLength / 1024).toFixed(2)
      console.log(size)

      // 上传拍照信息  调用接口上传图片 .........

      // 保存到本地
      this.dialogCamera = false
      let ADOM = document.createElement('a')
      ADOM.href = this.headImgSrc
      ADOM.download = new Date().getTime() + '.jpeg'
      ADOM.click()
    },
    // 关闭摄像头
    closeCamera() {
      if (!this.$refs['video'].srcObject) {
        this.dialogCamera = false
        return
      }
      let stream = this.$refs['video'].srcObject
      let tracks = stream.getTracks()
      tracks.forEach(track => {
        track.stop()
      })
      this.$refs['video'].srcObject = null
    },
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
  overflow: hidden;
}

</style>
