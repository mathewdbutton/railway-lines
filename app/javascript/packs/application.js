import Vue from 'vue/dist/vue.esm'
import App from '../src/App.vue'
import Vuetify from 'vuetify'
import Raven from 'raven-js';
import RavenVue from 'raven-js/plugins/vue';

Raven
    .config('https://ff28064be29b443b858cc2a2382a442a@sentry.io/1129439')
    .addPlugin(RavenVue, Vue)
    .install();

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
