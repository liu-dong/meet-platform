import { getUserDetail, login, logout, refreshToken } from '@/api/auth'
import { getToken, removeToken, setToken } from '@/utils/auth'
import { resetRouter } from '@/router'

const getDefaultState = () => {
  return {
    token: getToken(),
    // 账号id
    accountId: '',
    // 用户id
    userId: '',
    // 人员id
    personId: '',
    // 用户名
    username: '',
    // 昵称
    nickname: '',
    // 头像
    avatar: '',
    // 真实姓名
    realName: '',
    // 单位id
    orgId: '',
    // 单位名称
    orgName: '',
    // 拥有角色(角色码)
    roles: [],
    // 拥有权限(权限码)
    permissions: []
  }
}

const state = getDefaultState()

const mutations = {
  RESET_STATE: (state) => {
    Object.assign(state, getDefaultState())
  },
  SET_TOKEN: (state, token) => {
    state.token = token
  },
  SET_ACCOUNT_ID: (state, accountId) => {
    state.accountId = accountId
  },
  SET_USER_ID: (state, userId) => {
    state.userId = userId
  },
  SET_PERSON_ID: (state, personId) => {
    state.personId = personId
  },
  SET_USERNAME: (state, username) => {
    state.username = username
  },
  SET_NICKNAME: (state, nickname) => {
    state.nickname = nickname
  },
  SET_AVATAR: (state, avatar) => {
    state.avatar = avatar
  },
  SET_REAL_NAME: (state, realName) => {
    state.realName = realName
  },
  SET_ORG_ID: (state, orgId) => {
    state.orgId = orgId
  },
  SET_ORG_NAME: (state, orgName) => {
    state.orgName = orgName
  },
  SET_ROLES: (state, roles) => {
    state.roles = roles
  },
  SET_PERMISSIONS: (state, permissions) => {
    state.permissions = permissions
  }
}

const actions = {
  // user login
  login({ commit }, userInfo) {
    const { username, password, captcha } = userInfo
    return new Promise((resolve, reject) => {
      const param = {
        username: username.trim(),
        password: password.trim(),
        captcha: captcha.trim() || 1
      }
      login(param).then(response => {
        const { data } = response
        commit('SET_TOKEN', data)
        setToken(data)
        resolve()
      }).catch(error => {
        reject(error)
      })
    })
  },

  // get user info
  getInfo({ commit, state }) {
    return new Promise((resolve, reject) => {
      getUserDetail(state.token).then(response => {
        const { data } = response
        if (!data) {
          return reject('Verification failed, please Login again.')
        }
        const { accountId, userId, personId, username, nickname, avatar, realName, orgId, orgName, roles, permissions } = data
        commit('SET_ACCOUNT_ID', accountId)
        commit('SET_USER_ID', userId)
        commit('SET_PERSON_ID', personId)
        commit('SET_USERNAME', username)
        commit('SET_NICKNAME', nickname)
        commit('SET_AVATAR', avatar || 'https://tupian.qqw21.com/article/UploadPic/2020-6/2020651254036599.jpg')
        commit('SET_REAL_NAME', realName)
        commit('SET_ORG_ID', orgId)
        commit('SET_ORG_NAME', orgName)
        commit('SET_ROLES', roles)
        commit('SET_PERMISSIONS', permissions)
        resolve(data)
      }).catch(error => {
        reject(error)
      })
    })
  },

  // 刷新token
  refreshToken({ commit, state }) {
    return new Promise((resolve, reject) => {
      refreshToken(state.token).then(response => {
        const { data } = response
        commit('SET_TOKEN', data)
        setToken(data)
        resolve()
      }).catch(error => {
        reject(error)
      })
    })
  },

  // user logout
  logout({ commit, state }) {
    return new Promise((resolve, reject) => {
      logout(state.token).then(() => {
        removeToken() // must remove  token  first
        resetRouter()
        commit('RESET_STATE')
        resolve()
      }).catch(error => {
        reject(error)
      })
    })
  },

  // remove token
  resetToken({ commit }) {
    return new Promise(resolve => {
      removeToken() // must remove  token  first
      commit('RESET_STATE')
      resolve()
    })
  }
}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}

