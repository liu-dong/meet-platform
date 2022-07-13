import {batchGetStaticSpec} from "@/api/billingDetails";

const staticData = {

    async getData(name) {
        let data = await batchGetStaticSpec({}).then(res => {
            if (res['code'] === 200) {
                return res['data']
            } else {
                return null
            }
        })
        if (data.length > 0) {
            return data[name]
        }
        return null
    },

    getName(value, data) {
        let result = '暂无内容'
        data.forEach(item => {
            if (item.value === value) {
                result = item.name
            }
        })
        return result
    },

    getValue(name, data) {
        let result = ''
        data.forEach(item => {
            if (item.name === name) {
                result = item.value
            }
        })
        return result
    }
}

export default staticData
