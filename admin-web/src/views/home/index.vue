<template>
  <div class="dashboard-container">
    <div class="dashboard-text">name: {{ name }}</div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import { websocketUrl } from '@/utils/global'

export default {
  name: 'Dashboard',
  data() {
    return {
      websocket: null
    }
  },
  computed: {
    ...mapGetters([
      'nickname'
    ])
  },
  created() {
    if (this.websocket === null) {
      this.init()
    }
  },
  destroyed() {
    // 销毁监听
    // 连接关闭的回调方法
    this.close()
  },
  methods: {
    init() {
      // 判断当前浏览器是否支持WebSocket
      if ('WebSocket' in window) {
        const username = this.name
        this.websocket = new WebSocket(websocketUrl + username)
        // 连接成功建立的回调方法
        this.websocket.onopen = this.open
        // 连接发生错误的回调方法
        this.websocket.onerror = this.error
        // 客户端接收服务端消息的回调方法
        this.websocket.onmessage = this.message
        this.websocket.onclose = this.close
      } else {
        console.log('当前浏览器 Not support WebSocket')
      }
    },
    open() {
      console.log('WebSocket连接成功!')
      // this.send(this.name)
    },
    error() {
      console.log('连接错误!')
    },
    message(msg) {
      this.$notify({
        type: 'success',
        title: '消息通知',
        message: msg.data,
        position: 'bottom-right',
        showClose: false
      })
      // this.$message.success(msg.data)
      console.log(msg.data)
    },
    // 发送消息给被连接的服务端
    send(params) {
      const messageBody = {
        'messageContent': params,
        'recipient': 'SuperAdmin'
      }
      this.websocket.send(JSON.stringify(messageBody))
    },
    close() {
      if (this.websocket) {
        this.websocket.close()
      }
      console.log('WebSocket已经关闭')
    }
  }

}
</script>

<style lang="scss" scoped>
.dashboard {
  &-container {
    margin: 30px;
  }

  &-text {
    font-size: 30px;
    line-height: 46px;
  }
}
</style>
