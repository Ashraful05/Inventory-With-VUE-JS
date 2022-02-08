<template>
    <div>
        <div>
            <router-link to="all-product" class="btn btn-outline-primary">All Product</router-link>
        </div>
        <div class="row justify-content-center">
            <div class="col-xl-12 col-lg-12 col-md-12">
                <div class="card shadow-sm my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="login-form">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Add Product</h1>
                                    </div>
                                    <form class="user" @submit.prevent="addProduct" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <label >Product Name</label>
                                                    <input type="text" v-model="form.product_name" class="form-control" id="exampleInputFirstName" placeholder="Enter Product Name">
                                                    <span class="text-danger" v-if="errors.product_name">{{ errors.product_name[0] }}</span>
                                                </div>
                                                <div class="col-md-6">
                                                    <label>Product Code</label>
                                                    <input type="text" v-model="form.product_code" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp"
                                                           placeholder="Enter Product Code">
                                                    <span class="text-danger" v-if="errors.product_code">{{ errors.product_code[0] }}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <label for="exampleFormControlSelect1">Product Category</label>
                                                    <select class="form-control" id="exampleFormControlSelect1" v-model="form.category_id">
                                                        <option :value="category.id" v-for="category in categories">{{ category.category_name }}</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-6">
                                                    <label >Product Supplier</label>
                                                    <select class="form-control" v-model="form.supplier_id" id="exampleFormControlSelect1">
                                                        <option :value="supplier.id" v-for="supplier in suppliers">{{ supplier.name }}</option>

                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col-md-4">
                                                    <label >Product Root</label>
                                                    <input type="text" v-model="form.root" class="form-control" >
                                                    <span class="text-danger" v-if="errors.root">{{ errors.root[0] }}</span>
                                                </div>
                                                <div class="col-md-4">
                                                    <label >Buying Price</label>
                                                    <input type="text" v-model="form.buying_price" class="form-control"  aria-describedby="emailHelp">
                                                    <span class="text-danger" v-if="errors.buying_price">{{ errors.buying_price[0] }}</span>
                                                </div>
                                                <div class="col-md-4">
                                                    <label>Selling Price</label>
                                                    <input type="text" v-model="form.selling_price" class="form-control" aria-describedby="emailHelp">
                                                    <span class="text-danger" v-if="errors.selling_price">{{ errors.selling_price[0] }}</span>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <label>Buying Date</label>
                                                    <input type="date" v-model="form.buying_date" class="form-control"  aria-describedby="emailHelp"
                                                           placeholder="Enter your Buying Date">
                                                    <span class="text-danger" v-if="errors.buying_date">{{ errors.buying_date[0] }}</span>
                                                </div>
                                                <div class="col-md-6">
                                                    <label>Product Quantity</label>
                                                    <input type="text" v-model="form.product_quantity" class="form-control"  aria-describedby="emailHelp">
                                                    <span class="text-danger" v-if="errors.product_quantity">{{ errors.product_quantity[0] }}</span>

                                                </div>
                                            </div>

                                        </div>

                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <input type="file" class="custom-file-input" id="customFile" @change="onFileSelected">
                                                    <span class="text-danger" v-if="errors.image">{{ errors.image[0] }}</span>
                                                    <label class="custom-file-label" for="customFile">Choose file</label>
                                                    <span class="text-danger"></span>
                                                </div>
                                                <div class="col-md-6">
                                                    <img :src="form.image" alt="" style="height: 40px; width: 40px;">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary btn-block">Add Product</button>
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
    name: "CreateProductComponent",
    data(){
        return {
            form:{
                product_name:null,
                product_code:null,
                buying_price:null,
                selling_price:null,
                buying_date:null,
                product_quantity:null,
                image:null,
                root:null,
                supplier_id:null,
                category_id:null,
            },
            errors:{},
            categories:{},
            suppliers:{},
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
                    this.form.image = event.target.result
                    console.log(event.target.result);
                };
                reader.readAsDataURL(file);
            }

        },

        addProduct(){
            // alert('hello')
            axios.post('/api/product',this.form)
                .then(() =>{
                    this.$router.push({ name: 'all-product' })
                    Notification.success()
                })
                .catch(
                    Notification.error()
                    // Toast.fire({
                    //     icon: 'warning',
                    //     // icon: 'error',
                    //     title: 'Invalid Credentials'
                    // })
                )
                .catch(error => this.errors = error.response.data.errors)
                // .catch( error => this.errors = error.response.data.errors )

        },
    },
    created(){
        axios.get('/api/category/')
            .then(({data}) => (this.categories = data))

        axios.get('/api/supplier/')
            .then(({data}) => (this.suppliers = data))
    }

}
</script>

<style scoped>

</style>
