<template>
    <ul v-if="featuresInner && featuresInner.length" class="list-group">

        <li v-for="feature of featuresInner" class="list-group-item">{{ feature.name }}: {{feature.value}}</li>

    </ul>
</template>

<script>
    export default {

        props: ['features'],

        data() {
            return {
                featuresInner: null,
            }
        },

        created(){

            this.$eventHub.$on('features-changed', features => this.featuresInner = features);
        },

        mounted(){
            this.featuresInner = _.cloneDeep(this.features)
        },
    }
</script>
