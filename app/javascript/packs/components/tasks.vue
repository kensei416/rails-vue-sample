<template>
<v-app>
  <v-card  flat>
    <v-card-text>
      <v-container fluid>
        <v-layout row>
          
          <v-flex xs10>
            <v-text-field
              label="Add a to do"
              v-model="task"
              @keyup.enter="AddTask"
              white
            ></v-text-field>
          </v-flex>
          <v-flex xs2>
            <v-btn fab light @click="AddTask"> 
              <v-icon dark>add</v-icon>
            </v-btn>
          </v-flex>
        </v-layout>
        <v-layout row>
          <v-flex>
            <h1>Task</h1>
            <v-list two-line>
              <template v-for="task in tasks">
                <v-list-tile avatar v-bind:key="task.id" v-show="!task.is_done">
                  <v-list-tile-action>
                    <v-checkbox v-model="task.is_done" @click="ToggleBool('task', task.id)"></v-checkbox>
                  </v-list-tile-action>
                  <v-list-tile-content>
                    <v-list-tile-title v-html="task.title"></v-list-tile-title>
                  </v-list-tile-content>
                  <v-list-tile-action>
                    <v-btn flat @click="ToggleBool('fav', task.id)">
                      <v-icon v-if="!task.fav">bookmark_border</v-icon>
                      <v-icon v-else color="red">bookmark_border</v-icon>
                    </v-btn>
                  </v-list-tile-action>
                </v-list-tile>
                <v-divider v-show="!task.is_done"></v-divider>
              </template>
            </v-list>
          </v-flex>
        </v-layout>
      </v-container>
    </v-card-text>
  </v-card>
  </v-app>
</template>

<script>
import axios from 'axios'

export default {
    data: () => ({
      task: '',
      tasks: []
    }),
    created() {
      this.fetchTasks()
    },
    methods: {
      AddTask() {
        axios.post('/api/tasks', { task: { title: this.task }}).then((response) => {
          this.tasks.push(response.data.task)
          this.task = ''
        }, (error) => {
          console.log('error')
        })
      },
      ToggleBool(type, task_id) {
        if (type === 'task') {
          axios.put(`/api/tasks/${task_id}`, { task: { is_done: true, fav: false} }).then((response) => {
            this.tasks[task_id-1].is_done = !this.tasks[task_id-1].is_done
          }, (error) => {
            console.log(error)
          })
        } else if (type === 'fav') {
          axios.put(`/api/tasks/${task_id}`, { task: { fav: true } }).then((response) => {
            this.tasks[task_id-1].fav = !this.tasks[task_id-1].fav
          }, (error) => {
            console.log(error)
          })
        }
      },
      FavTask(fav_id) {
        axios.put
        this.tasks[fav_id-1].fav = !this.tasks[fav_id-1].fav
      },
      fetchTasks() {
        axios.get('/api/tasks').then((response) => {
         this.tasks.push(...response.data.tasks)
        })
      }
    }
  }
</script>


<style scoped>
  [v-cloak] {
    display: none;
  }
</style>