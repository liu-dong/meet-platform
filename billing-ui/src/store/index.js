import Vue from 'vue'
import Vuex from 'vuex'
import VuexPersistence from 'vuex-persist'

Vue.use(Vuex)

const vuexSession = new VuexPersistence({
    storage: window.sessionStorage
})

const store = new Vuex.Store({
    state: {
        count: 0,
        userInfo: {},
        roleInfo: {},
        tokenInfo: {},
        accessToken: '',
        refreshToken: '',
        tokenType: ''
    },
    mutations: {
        INCREMENT(state) {
            state.count++
        },
        SET_USER_INFO(state, payload) {
            state.userInfo = payload.userInfo
            state.roleInfo = payload.roleInfo
        },
        // 移除token信息
        REMOVE_USER_INFO(state) {
            state.userInfo = {}
            state.roleInfo = {}
        },
        // 设置token信息
        SET_TOKEN_INFO(state, payload) {
            state.tokenInfo = payload
            state.accessToken = payload.access_token
            state.refreshToken = payload.refresh_token
            state.tokenType = payload.token_type
        },
        // 移除token信息
        REMOVE_TOKEN_INFO(state) {
            state.tokenInfo = {}
            state.accessToken = ''
            state.refreshToken = ''
            state.tokenType = ''
        }

    },
    actions: {
        increment(state) {
            state.commit('INCREMENT')
        },
        SET_USER_INFO(state, payload) {
            state.commit('SET_USER_INFO', payload)
        },
        // 移除用户信息
        REMOVE_USER_INFO(state) {
            state.commit('REMOVE_USER_INFO')
        },
        // 设置token信息
        SET_TOKEN_INFO(state, payload) {
            state.commit('SET_TOKEN_INFO', payload)
        },
        // 移除token信息
        REMOVE_TOKEN_INFO(state) {
            state.commit('REMOVE_TOKEN_INFO')
        }

    },
    getters: {
        accessToken: state => state.accessToken,
        refreshToken: state => state.refreshToken,
        authorization: state => state.tokenInfo.token_type + ' ' + state.tokenInfo.access_token,
        userInfo: state => state.userInfo,
        roles: state => state.roleInfo

    },
    plugins: [vuexSession.plugin]
})

export default store
