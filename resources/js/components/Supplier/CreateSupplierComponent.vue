<template>
    <div>
        <div>
            <router-link to="all-supplier" class="btn btn-outline-primary">All Supplier</router-link>
        </div>
        <div class="row justify-content-center">
            <div class="col-xl-12 col-lg-12 col-md-12">
                <div class="card shadow-sm my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="login-form">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Add Supplier</h1>
                                    </div>
                                    <form class="user" @submit.prevent="addSupplier" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <input type="text" v-model="form.name" class="form-control" id="exampleInputFirstName" placeholder="Enter Your Name">
                                                    <span class="text-danger" v-if="errors.name">{{ errors.name[0] }}</span>
                                                </div>
                                                <div class="col-md-6">
                                                    <input type="email" v-model="form.email" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp"
                                                           placeholder="Enter Email Address">
                                                    <span class="text-danger" v-if="errors.email">{{ errors.email[0] }}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <input type="text" v-model="form.address" class="form-control"  aria-describedby=""
                                                           placeholder="Enter Your Address">
                                                    <span class="text-danger" v-if="errors.address">{{ errors.address[0] }}</span>
                                                </div>
                                                <div class="col-md-6">
                                                    <input type="text" v-model="form.shopname" class="form-control"  aria-describedby="emailHelp"
                                                           placeholder="Enter Your Shop Name">
                                                    <span class="text-danger" v-if="errors.shopname">{{ errors.shopname[0] }}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <input type="text" v-model="form.phone" class="form-control" id="" aria-describedby="emailHelp"
                                                           placeholder="Enter Your Phone Number">
                                                    <span class="text-danger" v-if="errors.phone">{{ errors.phone[0] }}</span>
                                                </div>
                                                <div class="col-md-6">

                                                </div>
                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col-md-6">
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
                                            <button type="submit" class="btn btn-primary btn-block">Add Supplier</button>
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
    name: "CreateSupplierComponent",
    data(){
        return {
            form:{
                name:null,
                email:null,
                address:null,
                phone:null,
                shopname:null,
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

        addSupplier(){
            // alert('hello')
            axios.post('/api/supplier',this.form)
                .then(() =>{
                    this.$router.push({ name: 'all-supplier' })
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
