import {findDataCatalogItem} from "@/api/dataCatalog";

const dataCatalog = {

    async getData(name) {
        let data = await findDataCatalogItem({}).then(res => {
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
            if (item.itemCode == value) {
                result = item.itemName
            }
        })
        return result
    },

    getValue(name, data) {
        let result = ''
        data.forEach(item => {
            if (item.itemName == name) {
                result = item.itemCode
            }
        })
        return result
    }
}

export default dataCatalog
