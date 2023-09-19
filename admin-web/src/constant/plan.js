// 计划类型常量
export const planTypeOptions = [
  { label: '年度计划', value: 'year' },
  { label: '季度计划', value: 'quarter' },
  { label: '月度计划', value: 'month' },
  { label: '周计划', value: 'week' },
  { label: '日计划', value: 'day' }
]

// 计划状态常量
export const planStatusOptions = [
  { label: '未开始', value: 1 },
  { label: '进行中', value: 2 },
  { label: '已完成', value: 3 },
  { label: '延期', value: 4 }
]

// 计划类型Filter
export const planTypeMap = {
  day: '日计划',
  week: '周计划',
  month: '月度计划',
  quarter: '季度计划',
  year: '年度计划'
}

// 计划状态Filter
export const planStatusMap = {
  1: '未开始',
  2: '进行中',
  3: '已完成',
  4: '延期'
}

// 计划状态标签类型Filter（控制标签颜色）
export const tagTypeMap = {
  1: 'info',
  2: '',
  3: 'success',
  4: 'warning'
}
