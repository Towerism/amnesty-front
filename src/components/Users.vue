<template lang="pug">
  #users
    b-button(id="new-user-button" v-b-modal="'new-user'") New User
    b-table(striped hover :items="users" :fields="fields")
      template(slot="delete" scope="data")
        b-button(size="sm" variant="danger" @click="deleteUser(data.item.id)" v-if="isNotCurrentUser(data.item.id)") Delete
    b-modal(id="new-user" ref="newUserModal" title="New User" @shown="clearNewUser" :hide-footer="true")
      b-form(@submit.stop.prevent="submitNewUser")
        b-form-group(label="Email" label-for="email")
          b-form-input#email(type="email" required placeholder="Enter email" v-model="newUser.email")
        b-form-group(label="First Name" label-for="firstname")
          b-form-input#firstname(type="text" required placeholder="Enter first name" v-model="newUser.firstname")
        b-form-group(label="Last Name" label-for="lastname")
          b-form-input#lastname(type="text" required placeholder="Enter last name" v-model="newUser.lastname")
        b-btn(id="submit" type="submit" class="float-right") Submit
</template>

<script>
  export default {
    name: 'users',
    data() {
      return {
        fields: {
          id: { label: 'Id' },
          email: { label: 'Email' },
          firstname: { label: 'First Name' },
          lastname: { label: 'Last Name' },
          delete: { label: '' }
        },
        newUser: {
          firstname: '',
          lastname: '',
          email: ''
        }
      }
    },
    created() {
      this.$store.dispatch('users/fetchAll')
    },
    computed: {
      users() {
        return this.$store.getters['users/all']
      },
      totalRows() {
        return this.users.length
      }
    },
    methods: {
      submitNewUser() {
        this.addNewUser()
        this.$refs.newUserModal.hide()
      },
      addNewUser() {
        return this.$store.dispatch('users/create', this.newUser)
      },
      clearNewUser() {
        this.newUser = {
          firstname: '',
          lastname: '',
          email: ''
        }
      },
      deleteUser(id) {
        return this.$store.dispatch('users/delete', id)
      },
      isNotCurrentUser(id) {
        return this.$store.getters['auth/user'].id !== id
      }
    }
  }
</script>

<style lang="stylus" scoped>
  #new-user-button
    margin-bottom: 15px
  #submit
    margin-top: 10px
</style>
