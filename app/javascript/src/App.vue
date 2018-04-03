<template>
    <div id="app">
            <timeline :allEvents="timelineEvents" :currentIndex="currentIndex"></timeline>
    </div>
</template>


<script>
    import Timeline from 'vue-timeline'
    import TimelineEvents from '../../assets/vuejs/timeline_nodes.js'
    export default {
        name: 'app',
        components: {
            'timeline': Timeline
        },
        data() {
            return {
                timelineEvents: TimelineEvents,
                currentIndex: 2
            }
        }
    }
</script>
