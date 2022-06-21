import builder from "@/axios";

const request = builder({ baseURL: process.env.VUE_APP_BILLING_API })

export default request
