/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

// window.Vue = require('vue').default;
import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

//imported route...
import {routes} from './routes';

//import global helper User class...
import User from './Helpers/User';
window.User = User

// import global helper Notification class....
import Notification from './Helpers/Notification';
window.Notification = Notification

//Sweet alert start...
import Swal from 'sweetalert2'
window.Swal = Swal;

const Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000,
    timerProgressBar: true,
    didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
    }
});
window.Toast = Toast;
//Sweet alert end.....

const router = new VueRouter({
    routes, // short for `routes: routes`
    mode: 'history'
})

// Vue.component('example-component', require('./components/ExampleComponent.vue').default);

window.Reload = new Vue();

const app = new Vue({
    el: '#app',
    router
});
