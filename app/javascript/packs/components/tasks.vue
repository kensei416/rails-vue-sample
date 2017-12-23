<template>
  <v-container class="mt-2">
      <v-layout row>
        <v-flex xs12 sm8 offset-sm2>
           <task-panel/>
        </v-flex>
      </v-layout>
  </v-container>
</template>

<script>
import ToolbarPanel from './ToolbarPanel'
import TaskPanel from './TaskPanel'

export default {
    data: () => ({
      task: '',
      tasks: []
    }),
    methods: {
      // ToggleBool(type, task_id) {
      //   if (type === 'task') {
      //     axios.put(`/api/tasks/${task_id}`, { task: { is_done: true, fav: false} }).then((response) => {
      //       this.tasks[task_id-1].is_done = !this.tasks[task_id-1].is_done
      //     }, (error) => {
      //       console.log(error)
      //     })
      //   } else if (type === 'fav') {
      //     axios.put(`/api/tasks/${task_id}`, { task: { fav: true } }).then((response) => {
      //       this.tasks[task_id-1].fav = !this.tasks[task_id-1].fav
      //     }, (error) => {
      //       console.log(error)
      //     })
      //   }
      // },
      // FavTask(fav_id) {
      //   axios.put
      //   this.tasks[fav_id-1].fav = !this.tasks[fav_id-1].fav
      // },
      // fetchTasks() {
      //   axios.get('/api/tasks').then((response) => {
      //    this.tasks.push(...response.data.tasks)
      //   })
      // }
    },
    components: {
       ToolbarPanel,
       TaskPanel
   }
  }
</script>


<style scoped>
  [v-cloak] {
    display: none;
  }
</style>