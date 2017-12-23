<template>
  <v-app>
    <toolbar/>
    <main>
      <router-view></router-view>
    </main>
  </v-app>
</template>

<script>
import Header from './components/header.vue'

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
    components: {
    'toolbar': Header
    }
  }
</script>

<style>
.dialog {
  background-color: black;
}
[v-cloak] {
  display: none;
}
</style>
