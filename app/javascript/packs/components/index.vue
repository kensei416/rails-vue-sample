<template>
<v-container grid-list-xl text-xs-center>
  <v-layout row>
    <v-flex xs12 sm-8>
      <v-card>
        <v-list subheader>
            <v-list-tile avatar v-for="item in items" v-bind:key="item.title" @click="">
              <v-list-tile-action>
                <v-icon>{{ item.icon }}</v-icon>
              </v-list-tile-action>
              <v-list-tile-content>
                <v-list-tile-title v-html="item.title"></v-list-tile-title>
              </v-list-tile-content>
            </v-list-tile>
            <v-list-tile avatar @click="navigateTo('/tasks/new')">
            <v-list-tile-action>
                <v-icon>add</v-icon>
            </v-list-tile-action>
             <v-list-tile-content>
                <v-list-tile-title>新規作成</v-list-tile-title>
            </v-list-tile-content>
            </v-list-tile>
        </v-list>
        <v-divider></v-divider>
      </v-card>
    </v-flex>
  </v-layout>
</v-container>
</template>

<script>
import Header from './header.vue'

  export default {
    data () {
      return {
        items: [
          { title: '受信箱', icon: 'inbox' },
          { title: 'ブックマーク', icon: 'bookmark_border' },
          { title: '今日', icon: 'today' },
          { title: '家族', icon: 'people_outline' },
        ],
        model: false,
        notifications: false,
        sound: true,
        widgets: false
      }
    },
    methods: {
      navigateTo (root) {
        this.$router.push(root)
      }
    },
    components: {
    'navbar': Header,
    }
  }
</script>

<style>
.dialog {
  background-color: black;
}
</style>
