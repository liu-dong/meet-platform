import service from "@/axios/index";

const request = service({ baseURL: process.env.VUE_APP_BILLING_API })

export default request
