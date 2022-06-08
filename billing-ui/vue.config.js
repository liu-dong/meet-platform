module.exports = {
    // 修改的配置
    devServer: {
        port: 8081
        /*proxy: {
            '/api': {
                target: 'http://localhost:8181',
                changeOrigin: true,
                pathRewrite: {'^/api': ''}
            }
        }*/
    }
}
