<template>
    <div>
        <div>
            <router-link to="/stock" class="btn btn-outline btn-primary">View Stock</router-link>
        </div>
        <div class="row justify-content-center">
            <div class="col-xl-12 col-lg-12 col-md-12">
                <div class="card shadow-sm my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="login-form">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Update Product Stock</h1>
                                    </div>
                                    <form class="user" @submit.prevent="stockProduct" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col-md-12">
                                                    <label>Product Quantity</label>
                                                    <input type="text" v-model="form.product_quantity" class="form-control"  aria-describedby="emailHelp">
                                                    <span class="text-danger" v-if="errors.product_quantity">{{ errors.product_quantity[0] }}</span>

                                                </div>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary btn-block">Update Stock</button>
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
    name: "EditStockComponent",
    data(){
        return {
            form:{
                product_quantity:'',
            },
            errors:{},
        }
    },
    created(){
        let id = this.$route.params.id
        axios.get('/api/product/'+id)
            .then( ( {data} ) => (this.form = data))
            .catch(console.log('error'))

    },
    methods:{
        // onFileSelected(event){
        //     let file = event.target.files[0];
        //     if(file.size > 1048770){
        //         Notification.imageValidation()
        //     }else{
        //         let reader = new FileReader();
        //         reader.onload = event => {
        //             this.form.newimage = event.target.result
        //             // console.log(event.target.result);
        //         };
        //         reader.readAsDataURL(file);
        //     }
        //
        // },

        stockProduct(){
            // alert('hello')
            let id = this.$route.params.id
            axios.post('/api/stock/update/'+id, this.form)
                .then(() => {
                    this.$router.push({ name: 'stock' })
                    Notification.success()
                })
                .catch(error => this.errors = error.response.data.errors)
                // .catch( error => this.errors = error.response.data.errors )
                .catch(
                    Notification.error()

                )
        },

    }

}
</script>

<style scoped>

</style>
