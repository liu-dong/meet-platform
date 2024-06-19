// 使用require.context批量导入.svg文件，批量导入一组文件，三个参数：目录路径、是否搜索子目录、匹配文件的正则表达式
const req = require.context('../../../icons/svg', false, /\.svg$/)
// 直接处理导入的模块，提取并返回文件名
const svgIcons = req.keys().map((filePath) => {
  // 使用正则表达式匹配并提取文件名
  const match = filePath.match(/\.\/(.*)\.svg/)
  return match[1]
})
export default svgIcons
