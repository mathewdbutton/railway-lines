<template>
    <div id="app">
        <timeline :allEvents="timelineEvents" :currentIndex="timelineEvents.nodes.length-1"></timeline>
        <v-btn small @click.native="create_event('red')" color="blue">Make Event</v-btn>
        <v-btn small @click.native="get_events()" color="red">Get Events</v-btn>

    </div>
</template>


<script>
    import 'vuetify/dist/vuetify.min.css'
    import Timeline from 'vue-timeline'
    import TimelineEvents from '../../assets/vuejs/timeline_nodes.js'
    import axios from 'axios'
    import Vue from 'vue'

    export default {
        name: 'app',
        components: {
            'timeline': Timeline
        },
        data() {
            return {
                timelineEvents: {nodes:{}},
                currentIndex: 5
            }
        },
        methods: {
            create_event(title) {
                axios.post("http://localhost:3000/api/events", {title: title, timeline_id: 1})
            },
            get_events() {
                axios.get("http://localhost:3000/api/timelines/1").then(response => {
                    this.timelineEvents.nodes = response.data.included.map(event => {
                        return {
                            'type': 'encounter',
                            'desc': event.attributes.title
                        }
                    })
                    }
                )
            }
        }
    }
</script>
