/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue').default;
import Vue from 'vue';
import VueRouter from 'vue-router';
Vue.use(VueRouter);
import {routes} from "./routes";


Vue.component(
    'example-component',
     require('./components/ExampleComponent.vue').default
     );

Vue.component(
    'employee-index',
     require('./components/employees/index.vue').default
    );

Vue.component(
    'employee-create',
        require('./components/employees/create.vue').default
    );

Vue.component(
    'employee-edit',
        require('./components/employees/edit.vue').default
    );

const router = new VueRouter({
    mode: 'history',
    routes: routes,
});


const app = new Vue({
    el: '#app',
    router: router,
});
