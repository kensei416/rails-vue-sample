import Vue from 'vue/dist/vue.esm.js'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  strict: true,
  plugins: [
    createPersistedState()
  ],
  state: {
    token: null,
    user: null,
    isUserLoggedIn: false,
    tasks: [],
    loading: false,
    error: null
  },
  mutations: {
    setToken (state, token) {
      state.token = token
      if (token) {
        state.isUserLoggedIn = true
      } else {
        state.isUserLoggedIn = false
      }
    },
    setUser (state, user) {
      state.user = user
      state.isUserLoggedIn = true
    },
    setTasks (state, tasks) {
      state.tasks = tasks
    },
    logoutUser (state, user) {
      state.user = null
      state.isUserLoggedIn = null
    },
    setLoading (state, payload) {
      state.loading = payload
    },
    toggleTask(state, id) {
      state.tasks[id].is_done = !state.tasks[id].is_done
    }
  },
  actions: {
    setToken ({commit}, token) {
      commit('setToken', token)

    },
    setUser ({commit}, user) {
      commit('setUser', user)
    },
    LoadTasks({commit}) {
      commit('setLoading', true)
      axios.get('/api/tasks').then((response) => {
        const tasks = []
        const obj = response.data.tasks
        for (let key in obj) {
          tasks.push({
            id: key,
            title: obj[key].title,
            is_done: obj[key].is_done,
            fav: obj[key].fav,
            user_id: null
          })
        }
        
        commit('setTasks', tasks)
        commit('setLoading', false)
      })
    },
    toggleTask({commit}, payload) {
      payload += 1
      axios.put(`/api/tasks/${payload}`, { task: { is_done: true } }).then((response) => {
        commit('toggleTask', payload)
      }, (error) => {
        console.log(error)
      })
    },
    logoutUser({commit},) {
      commit('logoutUser')
    }
    
  },
  getters: {
    isUserLoggedIn (state) {
      return state.isUserLoggedIn
    },
    getUser (state) {
      return state.user
    },
    getTasks(state) {
      return state.tasks
    }
  }
})

