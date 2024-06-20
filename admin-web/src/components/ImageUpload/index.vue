<template>
  <div v-show="isShow" class="image-upload">
    <div class="image-upload-wrap">
      <div class="image-upload-close" @click="off">
        <i class="close-icon"/>
      </div>
      <div class="image-upload-area">
        <div
          class="drop-area"
          @dragleave="preventDefault"
          @dragover="preventDefault"
          @dragenter="preventDefault"
          @click="handleClick"
          @drop="handleChange"
        >
          <upload-icon v-show="loading !== 1"/>
          <span v-show="loading !== 1" class="upload-hint">{{ lang.hint }}</span>
          <span v-show="!isSupported" class="no-supported-hint">{{ lang.noSupported }}</span>
          <input v-show="false" ref="fileInput" type="file" @change="handleChange">
        </div>
        <div v-show="hasError" class="upload-error-hint">
          <i class="error-icon"/>
          {{ errorMsg }}
        </div>
        <div class="upload-operate">
          <a @click="off" @mousedown="ripple">{{ lang.btn.off }}</a>
        </div>
      </div>
      <canvas v-show="false" ref="canvas" :width="width" :height="height"/>
    </div>
  </div>
</template>

<script>
'use strict'// 指示编译器进入严格模式
import request from '@/axios/fileAxios'
import language from './utils/language.js'
import mimes from './utils/mimes.js'
import data2blob from './utils/dataToBlob.js'
import effectRipple from './utils/effectRipple.js'
import UploadIcon from '@/components/UploadIcon/index.vue'

export default {
  components: { UploadIcon },
  props: {
    // 域，上传文件name，触发事件会带上（如果一个页面多个图片上传控件，可以做区分
    field: {
      type: String,
      default: 'avatar'
    },
    // 原名key，类似于id，触发事件会带上（如果一个页面多个图片上传控件，可以做区分
    key: {
      type: Number,
      default: 0
    },
    // 显示该控件与否
    isShow: {
      type: Boolean,
      default: true
    },
    // 上传地址
    url: {
      type: String,
      default: ''
    },
    // 其他要上传文件附带的数据，对象格式
    params: {
      type: Object,
      default: null
    },
    // Add custom headers
    headers: {
      type: Object,
      default: null
    },
    // 剪裁图片的宽
    width: {
      type: Number,
      default: 200
    },
    // 剪裁图片的高
    height: {
      type: Number,
      default: 200
    },
    // 不显示旋转功能
    noRotate: {
      type: Boolean,
      default: true
    },
    // 不预览圆形图片
    noCircle: {
      type: Boolean,
      default: false
    },
    // 不预览方形图片
    noSquare: {
      type: Boolean,
      default: false
    },
    // 单文件大小限制
    maxSize: {
      type: Number,
      default: 10240
    },
    // 语言类型
    langType: {
      type: String,
      default: 'zh'
    },
    // 语言包
    langExt: {
      type: Object,
      default: null
    },
    // 图片上传格式
    imgFormat: {
      type: String,
      default: 'png'
    },
    // 是否支持跨域
    withCredentials: {
      type: Boolean,
      default: false
    }
  },
  data() {
    const { imgFormat, langType, langExt, width, height } = this
    let isSupported = true
    const allowImgFormat = ['jpg', 'png']
    const tempImgFormat =
      allowImgFormat.indexOf(imgFormat) === -1 ? 'jpg' : imgFormat
    const lang = language[langType] ? language[langType] : language['zh']
    const mime = mimes[tempImgFormat]
    // 规范图片格式
    this.imgFormat = tempImgFormat
    if (langExt) {
      Object.assign(lang, langExt)
    }
    if (typeof FormData !== 'function') {
      isSupported = false
    }
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
      loading: 0, // 0未开始 1正在 2成功 3错误
      progress: 0,
      // 是否有错误及错误信息
      hasError: false,
      errorMsg: '错误信息',
      // 需求图宽高比
      ratio: width / height,
      // 原图地址、生成图片地址
      sourceImg: null,
      sourceImgUrl: '',
      createImgUrl: '',
      // 原图片拖动事件初始值
      sourceImgMouseDown: {
        on: false,
        mX: 0, // 鼠标按下的坐标
        mY: 0,
        x: 0, // scale原图坐标
        y: 0
      },
      // 生成图片预览的容器大小
      previewContainer: {
        width: 100,
        height: 100
      },
      // 原图容器宽高
      sourceImgContainer: {
        // sic
        width: 240,
        height: 184 // 如果生成图比例与此一致会出现bug，先改成特殊的格式吧，哈哈哈
      },
      // 原图展示属性
      scale: {
        zoomAddOn: false, // 按钮缩放事件开启
        zoomSubOn: false, // 按钮缩放事件开启
        range: 1, // 最大100
        rotateLeft: false, // 按钮向左旋转事件开启
        rotateRight: false, // 按钮向右旋转事件开启
        degree: 0, // 旋转度数
        x: 0,
        y: 0,
        width: 0,
        height: 0,
        maxWidth: 0,
        maxHeight: 0,
        minWidth: 0, // 最宽
        minHeight: 0,
        naturalWidth: 0, // 原宽
        naturalHeight: 0
      }
    }
  },
  watch: {
    isShow(newValue) {
      if (newValue && this.loading !== 1) {
        this.reset()
      }
    }
  },
  created() {
    // 绑定按键esc隐藏此插件事件
    document.addEventListener('keyup', this.closeHandler)
  },
  destroyed() {
    document.removeEventListener('keyup', this.closeHandler)
  },
  methods: {
    // 点击波纹效果
    ripple(e) {
      effectRipple(e)
    },
    // 关闭控件
    off() {
      setTimeout(() => {
        this.$emit('input', false)
        this.$emit('close')
        if (this.step === 3 && this.loading === 2) {
          this.setStep(1)
        }
      }, 200)
    },
    // 设置步骤
    setStep(no) {
      // 延时是为了显示动画效果呢，哈哈哈
      setTimeout(() => {
        this.step = no
      }, 200)
    },
    /* 图片选择区域函数绑定
     ---------------------------------------------------------------*/
    preventDefault(e) {
      e.preventDefault()
      return false
    },
    handleClick(e) {
      if (this.loading !== 1) {
        if (e.target !== this.$refs.fileInput) {
          e.preventDefault()
          if (document.activeElement !== this.$refs) {
            this.$refs.fileInput.click()
          }
        }
      }
    },
    handleChange(e) {
      e.preventDefault()
      if (this.loading !== 1) {
        const files = e.target.files || e.dataTransfer.files
        this.reset()
        if (this.checkFile(files[0])) {
          this.setSourceImg(files[0])
        }
      }
    },
    /* ---------------------------------------------------------------*/
    // 检测选择的文件是否合适
    checkFile(file) {
      const { lang, maxSize } = this
      // 仅限图片
      if (file.type.indexOf('image') === -1) {
        this.hasError = true
        this.errorMsg = lang.error.onlyImg
        return false
      }
      // 超出大小
      if (file.size / 1024 > maxSize) {
        this.hasError = true
        this.errorMsg = lang.error.outOfSize + maxSize + 'kb'
        return false
      }
      return true
    },
    // 重置控件
    reset() {
      this.loading = 0
      this.hasError = false
      this.errorMsg = ''
      this.progress = 0
    },
    // 设置图片源
    setSourceImg(file) {
      const fr = new FileReader()
      fr.onload = () => {
        this.sourceImgUrl = fr.result
        this.startCrop()
      }
      fr.readAsDataURL(file)
    },
    // 剪裁前准备工作
    startCrop() {
      const {
        width,
        height,
        ratio,
        scale,
        sourceImgUrl,
        sourceImgMasking,
        lang
      } = this
      const sim = sourceImgMasking
      const img = new Image()
      img.src = sourceImgUrl
      img.onload = () => {
        const nWidth = img.naturalWidth
        const nHeight = img.naturalHeight
        const nRatio = nWidth / nHeight
        let w = sim.width
        let h = sim.height
        let x = 0
        let y = 0
        // 图片像素不达标
        if (nWidth < width || nHeight < height) {
          this.hasError = true
          this.errorMsg = lang.error.lowestPx + width + '*' + height
          return false
        }
        if (ratio > nRatio) {
          h = w / nRatio
          y = (sim.height - h) / 2
        }
        if (ratio < nRatio) {
          w = h * nRatio
          x = (sim.width - w) / 2
        }
        scale.range = 0
        scale.x = x
        scale.y = y
        scale.width = w
        scale.height = h
        scale.degree = 0
        scale.minWidth = w
        scale.minHeight = h
        scale.maxWidth = nWidth * sim.scale
        scale.maxHeight = nHeight * sim.scale
        scale.naturalWidth = nWidth
        scale.naturalHeight = nHeight
        this.sourceImg = img
        this.createImg()
        this.setStep(2)
      }
    },
    // 生成需求图片
    createImg(e) {
      const {
        mime,
        sourceImg,
        scale: { x, y, width, height, degree },
        sourceImgMasking: { scale }
      } = this
      const canvas = this.$refs.canvas
      const ctx = canvas.getContext('2d')
      if (e) {
        // 取消鼠标按下移动状态
        this.sourceImgMouseDown.on = false
      }
      canvas.width = this.width
      canvas.height = this.height
      ctx.clearRect(0, 0, this.width, this.height)
      // 将透明区域设置为白色底边
      ctx.fillStyle = '#fff'
      ctx.fillRect(0, 0, this.width, this.height)
      ctx.translate(this.width * 0.5, this.height * 0.5)
      ctx.rotate((Math.PI * degree) / 180)
      ctx.translate(-this.width * 0.5, -this.height * 0.5)
      ctx.drawImage(
        sourceImg,
        x / scale,
        y / scale,
        width / scale,
        height / scale
      )
      this.createImgUrl = canvas.toDataURL(mime)
    },
    // 上传图片
    upload() {
      const {
        lang,
        imgFormat,
        mime,
        url,
        params,
        field,
        key,
        createImgUrl
      } = this
      const fmData = new FormData()
      fmData.append(
        field,
        data2blob(createImgUrl, mime),
        field + '.' + imgFormat
      )
      // 添加其他参数
      if (typeof params === 'object' && params) {
        Object.keys(params).forEach(k => {
          fmData.append(k, params[k])
        })
      }
      // 监听进度回调
      // const uploadProgress = (event) => {
      //   if (event.lengthComputable) {
      //     this.progress = 100 * Math.round(event.loaded) / event.total
      //   }
      // }
      // 上传文件
      this.reset()
      this.loading = 1
      this.setStep(3)
      request({
        url,
        method: 'post',
        data: fmData
      })
        .then(resData => {
          this.loading = 2
          this.$emit('crop-upload-success', resData.data)
        })
        .catch(err => {
          if (this.isShow) {
            this.loading = 3
            this.hasError = true
            this.errorMsg = lang.fail
            this.$emit('crop-upload-fail', err, field, key)
          }
        })
    },
    closeHandler(e) {
      if (this.isShow && (e.key === 'Escape' || e.keyCode === 27)) {
        this.off()
      }
    }
  }
}
</script>

<style lang="scss">
@-webkit-keyframes image_progress {
  0% {
    background-position-y: 0;
  }
  100% {
    background-position-y: 40px;
  }
}

@keyframes image_progress {
  0% {
    background-position-y: 0;
  }
  100% {
    background-position-y: 40px;
  }
}

@-webkit-keyframes image-crop-upload {
  0% {
    opacity: 0;
    -webkit-transform: scale(0) translatey(-60px);
    transform: scale(0) translatey(-60px);
  }
  100% {
    opacity: 1;
    -webkit-transform: scale(1) translatey(0);
    transform: scale(1) translatey(0);
  }
}

@keyframes image-crop-upload {
  0% {
    opacity: 0;
    -webkit-transform: scale(0) translatey(-60px);
    transform: scale(0) translatey(-60px);
  }
  100% {
    opacity: 1;
    -webkit-transform: scale(1) translatey(0);
    transform: scale(1) translatey(0);
  }
}

.image-upload {
  position: fixed;
  display: block;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  z-index: 10000;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.65);
  -webkit-tap-highlight-color: transparent;
  -moz-tap-highlight-color: transparent;

  .image-upload-wrap {
    -webkit-box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.23);
    box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.23);
    position: fixed;
    display: block;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    z-index: 10000;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    margin: auto;
    width: 600px;
    height: 330px;
    padding: 25px;
    background-color: #fff;
    border-radius: 2px;
    -webkit-animation: image-crop-upload 0.12s ease-in;
    animation: image-crop-upload 0.12s ease-in;

    .image-upload-close {
      position: absolute;
      right: -30px;
      top: -30px;

      .close-icon {
        position: relative;
        display: block;
        width: 30px;
        height: 30px;
        cursor: pointer;
        -webkit-transition: -webkit-transform 0.18s;
        transition: transform 0.18s, -webkit-transform 0.18s;
        -webkit-transform: rotate(0);
        -ms-transform: rotate(0);
        transform: rotate(0);

        &::after,&::before {
          -webkit-box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.23);
          box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.23);
          content: "";
          position: absolute;
          top: 12px;
          left: 4px;
          width: 20px;
          height: 3px;
          -webkit-transform: rotate(45deg);
          -ms-transform: rotate(45deg);
          transform: rotate(45deg);
          background-color: #fff;
        }

        &::after {
          -webkit-transform: rotate(-45deg);
          -ms-transform: rotate(-45deg);
          transform: rotate(-45deg);
        }

        &:hover {
          -webkit-transform: rotate(90deg);
          -ms-transform: rotate(90deg);
          transform: rotate(90deg);
        }
      }
    }
  }

  .image-upload-area {
    .drop-area {
      position: relative;
      -webkit-box-sizing: border-box;
      box-sizing: border-box;
      padding: 35px;
      height: 170px;
      background-color: rgba(0, 0, 0, 0.03);
      text-align: center;
      border: 1px dashed rgba(0, 0, 0, 0.08);
      overflow: hidden;

      .upload-hint {
        display: block;
        padding: 15px;
        font-size: 14px;
        color: #666;
        line-height: 30px;
      }

      .no-supported-hint {
        display: block;
        position: absolute;
        top: 0;
        left: 0;
        padding: 30px;
        width: 100%;
        height: 60px;
        line-height: 30px;
        background-color: #eee;
        text-align: center;
        color: #666;
        font-size: 14px;
      }

      &:hover {
        cursor: pointer;
        border-color: rgba(0, 0, 0, 0.1);
        background-color: rgba(0, 0, 0, 0.05);
      }
    }

    .upload-operate {
      position: absolute;
      right: 20px;
      bottom: 20px;

      a {
        position: relative;
        float: left;
        display: block;
        margin-left: 10px;
        width: 100px;
        height: 36px;
        line-height: 36px;
        text-align: center;
        cursor: pointer;
        font-size: 14px;
        color: #4a7;
        border-radius: 2px;
        overflow: hidden;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      a:hover {
        background-color: rgba(0, 0, 0, 0.03);
      }

    }

    .upload-error-hint {
      display: block;
      font-size: 14px;
      line-height: 24px;
      height: 24px;
      color: #d10;
      text-align: center;

      .error-icon {
        position: relative;
        display: inline-block;
        width: 20px;
        height: 20px;
        top: 4px;
      }

      .error-icon::after,
      .error-icon::before {
        content: "";
        position: absolute;
        top: 9px;
        left: 4px;
        width: 13px;
        height: 2px;
        background-color: #d10;
        -webkit-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        transform: rotate(45deg);
      }

      .error-icon::after {
        -webkit-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
        transform: rotate(-45deg);
      }
    }

    .upload-error-hint {
      vertical-align: top;
    }
  }
}

</style>
