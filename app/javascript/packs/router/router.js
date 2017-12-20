import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import Index from '../components/index.vue'
import Tasks from '../components/tasks.vue'
import NewTask from '../components/newtask.vue'
import Account from '../components/account.vue'
import Contact from '../components/contact.vue'

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', component: Index },
    { path: '/tasks', component: Tasks },
    { path: '/tasks/new', component: NewTask},
    { path: '/account', component: Account },
    { path: '/contact', component: Contact }
  ],
})