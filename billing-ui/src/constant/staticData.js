const spendingType = [
    {value: 1, name: '餐饮'},
    {value: 2, name: '房租'},
    {value: 3, name: '购物'},
    {value: 4, name: '娱乐'}
]

export const getName = (value, data) => {
    let result = '暂无内容'
    data.forEach(item => {
        if (item.value === value) {
            result = item.name
        }
    })
    return result
}

export const getValue = (name, data) => {
    let result = ''
    data.forEach(item => {
        if (item.name === name) {
            result = item.value
        }
    })
    return result
}

export default {
    spendingType,
}
