import builder from "@/axios/index";

const request = builder({ baseURL: process.env.VUE_APP_AUTH_API })

export default request
