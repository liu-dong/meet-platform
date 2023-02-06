// 密码模式认证参数
export const passwordData = {
    'client_id': 'ui',
    'client_secret': 'secret',
    'grant_type': 'password'
}

// 客户端凭据模式
export const clientData = {
    'auth': {
        'username': 'ui',
        'password': 'secret'
    },
    'params': {
        'grant_type': 'client_credentials'
    }
}


// 授权码模式
export const codeData = {
    'client_id': 'liudong',
    'client_secret': 'secret',
    'grant_type': 'authorization_code',
    'redirect_uri': 'http://localhost:8080/'
}

// 隐式授权码模式
export const implicitData = {
    'response_type': 'token',
    'client_id': 'liudong',
    'scope': 'all',
    'redirect_uri': 'http://localhost:8080/'
}
