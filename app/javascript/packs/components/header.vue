<template>
  <v-layout wrap mb-2>
    <v-toolbar class="cyan accent-3" dark >
      <v-toolbar-title class="white--text">todo</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn icon v-for="item in items" :key="item.icon" @click="navigateTo(item.root)">
        <v-icon>{{ item.icon }}</v-icon>
      </v-btn>
    </v-toolbar>
  </v-layout>
</template>
<script>
  export default {
    data: () => ({
      drawers: ['Permanent', 'Persistent', 'Temporary'],
      model: false,
      items: [
        { icon: 'add', root: '/' },
        { icon: 'notifications_none', root: '/account' },
        { icon: 'bookmark_border', root: '/contact' },
        { icon: 'settings', root: '/setting'}
      ]
    }),
    methods: {
      navigateTo (root) {
        this.$router.push(root)
      }
    }
  }
</script>