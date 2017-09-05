<template lang="pug">
  screen(title="Change Password")
    b-form(@submit.prevent="onSubmit")
      b-form-group(label="Current Password" label-for="currentPassword")
        b-form-input#currentPassword(type="password" required placeholder="Enter current password" v-model="model.oldPassword")
      b-form-group(label="New Password" label-for="newPassword")
        b-form-input#newPassword(type="password" required placeholder="Enter new password" v-model="model.newPassword")
      b-form-group(label="Confirm Password" label-for="confirmPassword")
        b-form-input#confirmPassword(type="password" required placeholder="Confirm new password" v-model="model.confirmPassword")
      b-button(type="submit") Submit
</template>

<script>
  import Screen from './Screen'
  import api from '@/api'

  export default {
    name: 'change-password',
    components: {
      Screen
    },
    data() {
      return {
        model: {
          oldPassword: '',
          newPassword: '',
          confirmPassword: ''
        }
      }
    },
    methods: {
      onSubmit() {
        let id = this.$store.getters['auth/user'].id
        api.post(`/users/${id}/password`, this.model).then(() => {
          this.$router.push('/')
        })
      }
    }
  }
</script>
