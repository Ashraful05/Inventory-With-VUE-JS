<template>
    <div>
        <div>
            <router-link to="all-customer" class="btn btn-outline-primary">All Customer</router-link>
        </div>
        <div class="row justify-content-center">
            <div class="col-xl-12 col-lg-12 col-md-12">
                <div class="card shadow-sm my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="login-form">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Add Customer</h1>
                                    </div>
                                    <form class="user" @submit.prevent="addCustomer" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <label for="">Customer Name:</label>
                                                    <input type="text" v-model="form.name" class="form-control" id="exampleInputFirstName" placeholder="Enter Your Name">
                                                    <span class="text-danger" v-if="errors.name">{{ errors.name[0] }}</span>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="">Customer Email</label>
                                                    <input type="email" v-model="form.email" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp"
                                                           placeholder="Enter Email Address">
                                                    <span class="text-danger" v-if="errors.email">{{ errors.email[0] }}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <label for="">Customer Address</label>
                                                    <input type="text" v-model="form.address" class="form-control"  aria-describedby=""
                                                           placeholder="Enter Your Address">
                                                    <span class="text-danger" v-if="errors.address">{{ errors.address[0] }}</span>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="">Customer Phone</label>
                                                    <input type="text" v-model="form.phone" class="form-control"  aria-describedby="emailHelp"
                                                           placeholder="Enter Your Phone number">
                                                    <span class="text-danger" v-if="errors.phone">{{ errors.phone[0] }}</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <label for="">Customer Image</label>
                                                    <input type="file" class="custom-file-input" id="customFile" @change="onFileSelected">
                                                    <span class="text-danger" v-if="errors.photo">{{ errors.photo[0] }}</span>
                                                    <label class="custom-file-label" for="customFile">Choose file</label>
                                                    <span class="text-danger"></span>
                                                </div>
                                                <div class="col-md-6">
                                                    <img :src="form.photo" alt="" style="height: 40px; width: 40px;">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary btn-block">Add Customer</button>
                                        </div>
                                        <hr>

                                    </form>

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
        if(!User.loggedIn()){
            this.$router.push({ name: '/' })
        }
    },
    name: "CreateCustomerComponent",
    data(){
        return {
            form:{
                name:null,
                email:null,
                address:null,
                phone:null,
                photo:null
            },
            errors:{

            }
        }
    },
    methods:{
        onFileSelected(event){
            let file = event.target.files[0];
            if(file.size > 1048770){
                Notification.imageValidation()
            }else{
                let reader = new FileReader();
                reader.onload = event => {
                    this.form.photo = event.target.result
                    console.log(event.target.result);
                };
                reader.readAsDataURL(file);
            }

        },

        addCustomer(){
            // alert('hello')
            axios.post('/api/customer',this.form)
                .then(() =>{
                    this.$router.push({ name: 'all-customer' })
                    Notification.success()
                })
                .catch(error => this.errors = error.response.data.errors)
                // .catch( error => this.errors = error.response.data.errors )
                .catch(
                    Notification.error()
                    // Toast.fire({
                    //     icon: 'warning',
                    //     // icon: 'error',
                    //     title: 'Invalid Credentials'
                    // })
                )
        },

    }

}
</script>

<style scoped>

</style>
