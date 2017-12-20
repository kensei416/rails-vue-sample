<template>
 <v-app>
   <v-layout justify-center>
    <v-flex xs12 sm10 md8 lg6>
      <v-card ref="form">
        <v-card-text>
          <v-text-field
            label="Email"
            placeholder="Press Your Email"
            v-model="email"
            required
            type="email"
            ref="email"
            :rules="[
              () => !!email || 'This field is required',
              () => !!email.match(/^\S+@\S+\.\S+$/) && address.length <= 255 || 'Your Address is Invalid'
            ]"
            counter="255"
            :error-messages="errorMessages"
          ></v-text-field>
          <v-text-field
            label="UserId"
            placeholder="Press Your UserId"
            v-model="user_id"
            required
            ref="user_id"
            :rules="[
              () => !!user_id || 'This field is required',
              () => !!user_id.match(/^[a-z0-9]+$/) && user_id.length <= 14 || 'Your Id can not use large characters and maximum word length is 14'
            ]"
            counter="14"
            
          ></v-text-field>
          <v-text-field
            label="Password"
            v-model="password"
            required
            type="password"
            ref="password"
            :rules="[() => !!password || 'This field is required']"
          ></v-text-field>
          <v-text-field
            label="Passoword Confirmation"
            v-model="password_confirmation"
            required
            type="password"
            ref="password_confirmation"
            :rules="[() => !!password_confirmation || 'This field is required']"
          ></v-text-field>
        </v-card-text>
        <v-divider class="mt-5"></v-divider>
        <v-card-actions>
          <v-btn flat>Cancel</v-btn>
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
          <v-btn color="primary" flat @click="submit">Submit</v-btn>
        </v-card-actions>
      </v-card>
    </v-flex>
  </v-layout>
  </v-container>
  </v-app>
</template>
<script>
import Gravatar from 'vue-gravatar';

export default {
    data () {
      return{
        name: '',
        email: '',
        user_id: '',
        password: '',
        password_confirmation: '',
        formHasErrors: false,
        errorMessages: []
      }
    },
    methods: {
      submit () {
      }
    },
    computed: {
      form () {
        return {
          email: this.email,
          user_id: this.user_id,
          password: this.password,
          password_confirmation: this.password_confirmation
        }
      }
    },
    components: {
     'v-gravatar': Gravatar
    }
  }
</script>
