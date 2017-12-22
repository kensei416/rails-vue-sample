<template>
  <v-app>
    <headerrr/>
    <main>
      <router-view></router-view>
    </main>
  </v-app>
</template>

<script>
import Header from './components/header.vue'
import Login from './components/login.vue'

  export default {
    data () {
      return {
        dialog: false,
      }
    },
    methods: {
      navigateTo (root) {
        this.$router.push(root)
      }
    },
    computed:{
      logged_in() {
        return this.$store.getters.isUserLoggedIn
      }
    },
    components: {
    'login': Login,
    'headerrr': Header
    }
  }
</script>

<style>
.dialog {
  background-color: black;
}
</style>
