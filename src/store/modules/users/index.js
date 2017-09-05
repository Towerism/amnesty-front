import api from '@/api'

export default {
  namespaced: true,
  state: {
    all: []
  },
  getters: {
    all: state => state.all
  },
  mutations: {
    delete(state, id) {
      let index = state.all.findIndex(user => user.id === id)
      state.all.splice(index, 1)
    },
    set(state, users) {
      state.all = users
    }
  },
  actions: {
    create(context, user) {
      return api.post('/users/create', user).then(() => {
        context.dispatch('fetchAll')
      })
    },
    delete(context, id) {
      return api.delete(`/users/${id}`).then(() => {
        context.commit('delete', id)
      })
    },
    fetchAll(context) {
      return api.get('/users').then(response => {
        context.commit('set', response.data)
      })
    }
  }
}
