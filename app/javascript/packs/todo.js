import Vue from 'vue/dist/vue.esm.js'
import Header from './components/header.vue'
import Vuetify from 'vuetify'
import Router from './router/router'
import store from './store/store'
import { sync } from 'vuex-router-sync'




Vue.use(Vuetify)

sync(store, Router)


var app = new Vue({
  el: '#app',
  router: Router,
  store: store,
  components: {
    'navbar': Header
  }
});