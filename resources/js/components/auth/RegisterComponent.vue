<template>
    <div>
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card shadow-sm my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="login-form">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Register</h1>
                                    </div>
                                    <form class="user" @submit.prevent="register">
                                        <div class="form-group">
                                            <input type="text" v-model="form.name" class="form-control" id="exampleInputFirstName" placeholder="Enter Your Name">
                                            <span class="text-danger" v-if="errors.name">{{ errors.name[0] }}</span>
                                        </div>
                                        <div class="form-group">
                                            <input type="email" v-model="form.email" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp"
                                                   placeholder="Enter Email Address">
                                            <span class="text-danger" v-if="errors.email">{{ errors.email[0] }}</span>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" v-model="form.password" class="form-control" id="exampleInputPassword" placeholder="Password">
                                            <span class="text-danger" v-if="errors.password">{{ errors.password[0] }}</span>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" v-model="form.password_confirmation" class="form-control" id="exampleInputPasswordRepeat"
                                                   placeholder="Confirm Password">
                                            <span class="text-danger" v-if="errors.password_confirmation">{{ errors.password_confirmation[0] }}</span>
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary btn-block">Register</button>
                                        </div>
                                        <hr>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <router-link to="/" class="font-weight-bold small" >Already have an account?</router-link>
                                    </div>
                                    <div class="text-center">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    created() {
        if(User.loggedIn()){
            this.$router.push({ name: 'home' })
        }
    },
    name: "RegisterComponent",
    data(){
        return {
            form:{
                name:null,
                email:null,
                password:null,
                password_confirmation:null
            },
            errors:{

            }
        }
    },
    methods:{
        register(){
            // alert('hello')
            axios.post('http://127.0.0.1:8000/api/register',this.form)
                .then(res => {
                    User.responseAfterLogin(res)
                    Toast.fire({
                        icon: 'success',
                        title: 'Registered Successfully'
                    })
                    this.$router.push({ name: 'home'})
                })

                .catch( error => this.errors = error.response.data.errors )
                // .catch(
                //     Toast.fire({
                //         icon: 'warning',
                //         // icon: 'error',
                //         title: 'Invalid Credentials'
                //     })
                // )
        }
    }
}
</script>

<style type="text/css" scoped>

</style>
