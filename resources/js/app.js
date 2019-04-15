
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i);
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default));

Vue.component('features', require('./components/Features.vue').default);
Vue.prototype.$eventHub = new Vue();

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',

    data() {
        return {
            productModificationId: null,
        }
    },

    watch: {
        productModificationId: function (id) {

            axios.get(`/product-modifications/${id}`).then((response) => {

                // parse data

                let productFeaturesIds = _.map(response.data.product.feature_values, (fv) => +fv.feature.id);

                let features = _.map(
                    response.data.product.feature_values,
                    (fv) => {

                        let targetFeatureValue = _.find(response.data.feature_values, (fv2) => +fv2.feature.id === +fv.feature.id )
                            || fv;
                        return {
                            name: targetFeatureValue.feature.name,
                            value: targetFeatureValue.value
                        }
                    })
                    .concat(_.map(
                            _.pickBy(
                                response.data.feature_values,
                                (fv) => productFeaturesIds.indexOf(+fv.feature.id) === -1
                            ),
                        (fv) => {
                            return {
                                name: fv.feature.name,
                                value: fv.value
                            }
                        }));

                this.$eventHub.$emit('features-changed', features)

            });
        },
    }
});
