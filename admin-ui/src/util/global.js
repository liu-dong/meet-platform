/**
 * 全局常量、方法封装模块
 * 通过原型挂载到Vue属性
 * 通过 this.Global 调用
 */

// 网关服务地址
export const baseUrl = 'http://localhost:8480'
// 认证授权服务地址
export const uuaUrl = 'http://localhost:8580'
// 用户服务地址
export const accountUrl = 'http://localhost:8084'
// 项目环境
export const env = 'dev'// 开发模式，需要开启后端应用

// export const env = 'test';//演示模式，不需要开启后端应用

// 图片校验码地址
export const kaptchaUrl = '/getKaptcha'

// 图片二维码地址
export const QRCodeUrl = '/authentication-server/authorization/getQRCode'

export default {
  baseUrl,
  uuaUrl,
  accountUrl,
  env,
  kaptchaUrl,
  QRCodeUrl
}
