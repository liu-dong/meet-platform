import { findDataCatalogItemList } from '@/api/dataCatalog'

const dataCatalogUtils = {

  async getData(name) {
    try {
      const response = await findDataCatalogItemList({})
      if (response['code'] === 200) {
        return response['data'] ? response['data'][name] : null
      }
    } catch (error) {
      console.error('查询数据字典失败：', error)
    }
  },

  getName(value, data) {
    const item = data.find(item => item.itemCode === String(value))
    return item ? item.itemName : '暂无内容'
  },

  getValue(name, data) {
    const item = data.find(item => item.itemName === String(name))
    return item ? item.itemCode : ''
  }
}

export default dataCatalogUtils
