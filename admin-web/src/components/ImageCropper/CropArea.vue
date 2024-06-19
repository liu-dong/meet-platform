<template>
  <div class="image-crop-upload-step2">
    <div class="image-crop-upload-crop">
      <div v-show="true" class="image-crop-upload-crop-left">
        <div class="image-crop-upload-img-container">
          <img
            ref="img"
            :src="sourceImgUrl"
            :style="sourceImgStyle"
            class="image-crop-upload-img"
            draggable="false"
            alt="图片"
            @drag="preventDefault"
            @dragstart="preventDefault"
            @dragend="preventDefault"
            @dragleave="preventDefault"
            @dragover="preventDefault"
            @dragenter="preventDefault"
            @drop="preventDefault"
            @touchstart="imgStartMove"
            @touchmove="imgMove"
            @touchend="createImg"
            @touchcancel="createImg"
            @mousedown="imgStartMove"
            @mousemove="imgMove"
            @mouseup="createImg"
            @mouseout="createImg"
          >
          <div :style="sourceImgShadeStyle" class="image-crop-upload-img-shade image-crop-upload-img-shade-1"/>
          <div :style="sourceImgShadeStyle" class="image-crop-upload-img-shade image-crop-upload-img-shade-2"/>
        </div>

        <div class="image-crop-upload-range">
          <input
            :value="scale.range"
            type="range"
            step="1"
            min="0"
            max="100"
            @input="zoomChange"
          >
          <i
            class="image-crop-upload-icon5"
            @mousedown="startZoomSub"
            @mouseout="endZoomSub"
            @mouseup="endZoomSub"
          />
          <i
            class="image-crop-upload-icon6"
            @mousedown="startZoomAdd"
            @mouseout="endZoomAdd"
            @mouseup="endZoomAdd"
          />
        </div>

        <div v-if="!noRotate" class="image-crop-upload-rotate">
          <i @mousedown="startRotateLeft" @mouseout="endRotate" @mouseup="endRotate">↺</i>
          <i @mousedown="startRotateRight" @mouseout="endRotate" @mouseup="endRotate">↻</i>
        </div>
      </div>
      <div v-show="true" class="image-crop-upload-crop-right">
        <div class="image-crop-upload-preview">
          <div v-if="!noSquare" class="image-crop-upload-preview-item">
            <img :src="createImgUrl" :style="previewStyle" alt="">
            <span>{{ lang.preview }}</span>
          </div>
          <div v-if="!noCircle" class="image-crop-upload-preview-item image-crop-upload-preview-item-circle">
            <img :src="createImgUrl" :style="previewStyle" alt="">
            <span>{{ lang.preview }}</span>
          </div>
        </div>
      </div>
    </div>
    <div class="image-crop-upload-operate">
      <a @click="setStep(1)" @mousedown="ripple">{{ lang.btn.back }}</a>
      <a class="image-crop-upload-operate-btn" @click="prepareUpload" @mousedown="ripple">{{ lang.btn.save }}</a>
    </div>
  </div>
</template>
<script>
export default {
  name: "CropArea"
}
</script>


<style scoped>

</style>
