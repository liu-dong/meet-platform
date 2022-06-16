/**
 * 全局常量、方法封装模块
 * 通过原型挂载到Vue属性
 * 通过 this.Global 调用
 */

// 用户服务地址
export const authUrl = 'http://localhost:9180'
// 账单服务地址
export const billingUrl = 'http://localhost:9181'

// 项目环境
export const env = 'dev'// 开发模式，需要开启后端应用

// export const env = 'test';//演示模式，不需要开启后端应用

// 图片校验码地址
export const kaptchaUrl = '/getKaptcha'

// 图片二维码地址
export const QRCodeUrl = '/authentication-server/authorization/getQRCode'

export default {
    billingUrl,
    authUrl,
    env,
    kaptchaUrl,
    QRCodeUrl
}
