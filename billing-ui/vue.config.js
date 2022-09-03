module.exports = {
    // 修改的配置
    devServer: {
        port: 8081,
        proxy: {
            '/apiAuth': {
                target: 'http://localhost:8180',
                changeOrigin: true,
                pathRewrite: {'^/apiAuth': ''}
            },
            '/apiBilling': {
                target: 'http://localhost:8181',
                changeOrigin: true,
                pathRewrite: {'^/apiBilling': ''}
            }
        }
    }
}
