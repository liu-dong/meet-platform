import Vue from 'vue'
import Vuex from 'vuex'
import VuexPersistence from 'vuex-persist'

Vue.use(Vuex)

const vuexSession = new VuexPersistence({
    storage: window.sessionStorage
})

const store = new Vuex.Store({
    state: {
        userInfo: {},
        roleInfo: {},
        accessToken: '',
    },
    mutations: {
        INCREMENT(state) {
            state.count++
        },
        SET_USER_INFO(state, payload) {
            state.userInfo = payload
            // state.roleInfo = payload.roleInfo
        },
        // 移除token信息
        REMOVE_USER_INFO(state) {
            state.userInfo = {}
            state.roleInfo = {}
        },
        // 设置token信息
        SET_TOKEN_INFO(state, payload) {
            state.accessToken = payload
        },
        // 移除token信息
        REMOVE_TOKEN_INFO(state) {
            state.accessToken = ''
        }

    },
    actions: {
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
        userInfo: state => state.userInfo,
        roles: state => state.roleInfo

    },
    plugins: [vuexSession.plugin]
})

export default store
