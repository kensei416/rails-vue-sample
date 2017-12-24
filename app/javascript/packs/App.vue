<template>
  <v-app>
    <toolbar/>
    <v-container fluid grid-list-md v-show="logged_in">
      <v-layout row wrap>
      <v-flex d-flex xs4 offset-xs2 md3>
        <v-card dark>
           <v-list two-line subheader>
          <v-subheader inset>Project</v-subheader>
          <v-list-tile v-for="category in categories" v-bind:key="category.title" @click="">
            <v-list-tile-action>
              <v-icon color="grey lighten-1">{{ category.icon }}</v-icon>
            </v-list-tile-action>
            <v-list-tile-content>
              <v-list-tile-title>{{ category.title }}</v-list-tile-title>
            </v-list-tile-content>
            <v-list-tile-action>
              <v-btn icon ripple @click="">
                <v-icon color="grey lighten-1">settings</v-icon>
              </v-btn>
            </v-list-tile-action>
          </v-list-tile>
        </v-list>
        </v-card>
      </v-flex>
      <v-flex d-flex xs8 sm8 md6>
      <router-view></router-view>
      </v-flex>
      </v-layout>
    </v-container>
    <main v-show="!logged_in">
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
         categories: [
          { title: '受信箱', icon: 'inbox' },
          { title: 'ブックマーク', icon: 'bookmark_border' },
          { title: '今日', icon: 'today' },
          { title: '家族', icon: 'people_outline' }
        ],
      }
    },
    components: {
    'toolbar': Header
    },
    computed: {
       logged_in() {
        return this.$store.getters.isUserLoggedIn
      }
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
