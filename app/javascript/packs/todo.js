import Vue from 'vue/dist/vue.esm.js'
import Vuetify from 'vuetify'
import App from './App'
import Router from './router/router'
import store from './store/store'
import { sync } from 'vuex-router-sync'




Vue.use(Vuetify)
Vue.config.productionTip = false


sync(store, Router)


var app = new Vue({
  el: '#app',
  router: Router,
  store: store,
  render: h => h(App),
  created() {
    this.$store.dispatch('LoadTasks')  
  }
});