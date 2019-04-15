<template>
    <div v-if="infoInner">
        <h1>{{ infoInner.name }}</h1>
        <h2>{{ infoInner.code }}</h2>
        <h2>${{ infoInner.price }}</h2>
    </div>
</template>

<script>
    export default {

        props: ['info'],

        data() {
            return {
                infoInner: null
            }
        },

        created(){

            this.$eventHub.$on('product-main-info-changed', info => this.infoInner = info);
        },

        mounted(){

            this.infoInner = _.cloneDeep(this.info)
        },
    }
</script>
