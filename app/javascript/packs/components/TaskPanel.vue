<template>
  <v-card>
    <v-card-title>{{ title }}</v-card-title>
    <v-list three-line>
          <template v-for="task in tasks">
            <v-list-tile avatar v-bind:key="task.id">
              <v-list-tile-action>
                <v-checkbox :value="task.is_done" ></v-checkbox>
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
    }
  },
  computed: {
    tasks() {
      return this.$store.getters.getTasks
    }
  }
}
</script>