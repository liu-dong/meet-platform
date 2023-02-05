import builder from "@/axios";

const request = builder({ baseURL: process.env.VUE_APP_ADMIN_API })
// const request = builder({ baseURL: '/apiBilling' })

export default request
