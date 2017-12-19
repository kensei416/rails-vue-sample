<template>
  <v-layout wrap mb-2>
    <v-toolbar class="white">
      <v-toolbar-title class="dark--text">食</v-toolbar-title>
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
        { title: 'Dashboard', icon: 'search', root: '/' },
        { title: 'Account', icon: 'person_outline', root: '/account' },
        { title: 'Admin', icon: 'bookmark_border', root: '/contact' }
      ]
    }),
    methods: {
      navigateTo (root) {
        this.$router.push(root)
      }
    }
  }
</script>