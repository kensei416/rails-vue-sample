<template>
  <v-container>
   <v-layout justify-center>
    <v-flex xs12 sm10 md8 lg6>
      <v-card ref="form">
        <v-card-title v-show="ReturnErrors" class="red--text">
         <h1>Your address or user_id is Invalid </h1>
        </v-card-title>
        <v-card-title>
          <h1>Log in</h1>
        </v-card-title>
        <v-card-text>
          <v-text-field
            label="Email"
            placeholder="Press Your Email"
            v-model="form.email"
            required
            type="email"
            ref="email"
            :rules="[
              () => !!form.email || 'This field is required',
              () => !!form.email.match(/^\S+@\S+\.\S+$/) && form.email.length <= 255 || 'Your Email is Invalid'
            ]"
            counter="255"
          ></v-text-field>
          <v-text-field
            label="Password"
            v-model="form.password"
            required
            type="password"
            ref="password"
            :rules="[() => !!form.password || 'This field is required']"
          ></v-text-field>
        </v-card-text>
        <v-divider class="mt-5"></v-divider>
        <v-card-actions>
          <v-btn flat　@click="">Cancel</v-btn>
          <v-spacer></v-spacer>
          <v-slide-x-reverse-transition>
            <v-tooltip
              left
              v-if="formHasErrors"
            >
              <v-btn
                icon
                @click="resetForm"
                slot="activator"
                class="my-0"
              >
                <v-icon>refresh</v-icon>
              </v-btn>
              <span>Refresh form</span>
            </v-tooltip>
          </v-slide-x-reverse-transition>
          <v-btn color="primary" flat @click="login">Submit</v-btn>
        </v-card-actions>
      </v-card>
    </v-flex>
  </v-layout>
  </v-container>
</template>
<script>
import axios from 'axios'

export default {
    data () {
      return{
        email: '',
        password: '',
        formHasErrors: false,
        ReturnErrors: false
      }
    },
    methods: {
      resetForm () {
        this.formHasErrors = false

        Object.keys(this.form).forEach(f => {
          this.$refs[f].reset()
        })
      },
      async login () {
        this.formHasErrors = false

        Object.keys(this.form).forEach(f => {
          if (!this.form[f]) this.formHasErrors = true

          this.$refs[f].validate(true)
        })

        if (!this.formHasErrors) {
          try {
            const response = await axios.post('/api/sessions', 
              { session: { 
                email: this.form.email, 
                password: this.form.password 
              }
            })
            this.$store.dispatch('setUser', response.data)
            this.$router.push('/')
          } catch (error) {
            console.log(error)
          }
        }
      }
    },
    computed: {
      form () {
        return {
          email: this.email,
          password: this.password,
        }
      }
    }
  }
</script>
