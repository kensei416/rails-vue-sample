<template>
  <v-card>
    <v-card-title>{{ title }}</v-card-title>
    <v-list three-line>
          <template v-for="task in tasks">
            <v-list-tile avatar v-bind:key="task.id" v-show="task.is_done===false">
              <v-list-tile-action>
                <v-btn flat icon @click="updateTask(task.id)">
                  <v-icon>check_box_outline_blank</v-icon>
                </v-btn>
              </v-list-tile-action>
              <v-list-tile-content>
                <v-list-tile-title v-html="task.title"></v-list-tile-title>
              </v-list-tile-content>
              <v-list-tile-action>
                <v-icon>edit</v-icon>
              </v-list-tile-action>
            </v-list-tile>
          </template>
        </v-list>
  </v-card>
</template>


<script>
export default {

  data () {
    return {
      newTask: '',
      title: 'Hello'
    }
  },
  methods: {
    AddTask() {
      axios.post('/api/tasks', { task: { title: this.newTask }}).then((response) => {
        this.tasks.push(response.data.task)
        this.newTask = ''
      }, (error) => {
        console.log('error')
      })
    },
    updateTask (id) {
      this.$store.dispatch('toggleTask', id)
    }
  },
  computed: {
    tasks () {
      return this.$store.getters.getTasks
    }
  }
}
</script>