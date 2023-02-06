import builder from "@/axios/index";

const request = builder({baseURL: process.env.VUE_APP_AUTH_API})
// const request = builder({ baseURL: '/apiAuth' })

export default request
