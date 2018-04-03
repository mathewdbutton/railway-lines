import Vue from 'vue/dist/vue.esm'
import App from '../src/App.vue'
import Vuetify from 'vuetify'

Vue.use(Vuetify)

Vue.mixin({
    methods: {
        getAssetUrl: require.context('../../assets/vuejs', false, /\.(mp3|png|jpe?g|gif|svg)(\?.*)?$/)
    }
})

document.addEventListener('DOMContentLoaded', () => {
    document.body.appendChild(document.createElement('app'))
    const app = new Vue({
        el: 'app',
        template: '<App/>',
        components: { App }
    })

    console.log(app)
})