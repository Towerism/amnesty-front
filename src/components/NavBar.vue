<template lang="pug">
  #nav-bar
    b-navbar(toggleable="md" type="dark" variant="dark").fixed-top
      .container
        b-navbar-brand(to="/") Amnesty
        b-nav(is-nav-bar)
          b-nav-item(to="/home") Home
          b-nav-item(to="/users" v-if="loggedIn") Users
        b-nav(is-nav-bar).ml-auto
          b-nav-item-dropdown(v-if="loggedIn" :text="userFullname" right)
            b-dropdown-item(to="/user/changepassword") Change Password
            b-dropdown-item(@click="logout") Logout
          b-nav-item(v-else to="/login" right) Login
</template>

<script>
  export default {
    name: 'nav-bar',
    computed: {
      loggedIn() {
        return this.$store.getters['auth/isAuthenticated']
      },
      userFullname() {
        return this.$store.getters['auth/user'].fullname
      }
    },
    methods: {
      logout() {
        this.$store.dispatch('auth/logout')
        this.$router.push('/home')
      }
    }
  }
</script>
