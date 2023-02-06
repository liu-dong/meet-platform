module.exports = {
    // 修改的配置
    devServer: {
        port: 8081
        /* proxy: {
               '/api': {
                   target: 'http://192.168.154.127:8480',
                   changeOrigin: true,
                   pathRewrite: { '^/api': '' }
               }
           } */
    }
}
