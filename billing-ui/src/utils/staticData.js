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
        if (data) {
            console.log(data[name])
            return data[name]
        }
        return null
    },

    getName(value, data) {
        let result = '暂无内容'
        data.forEach(item => {
            if (item.valueValue == value) {
                result = item.valueName
            }
        })
        return result
    },

    getValue(name, data) {
        let result = ''
        data.forEach(item => {
            if (item.valueName == name) {
                result = item.valueValue
            }
        })
        return result
    }
}

export default staticData
