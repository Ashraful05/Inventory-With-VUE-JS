<template>

    <div>
        <div>
            <router-link to="add-product" class="btn btn-primary">Add Product</router-link>
        </div>
        <br>
        <input type="name" class="form-control" v-model="searchTerm" style="width: 300px;" placeholder="search...">
        <br>
        <div class="row">
            <div class="col-lg-12 mb-4">
                <!-- Simple Tables -->
                <div class="card">
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Product List</h6>
                    </div>
                    <div class="table-responsive">
                        <table class="table align-items-center table-flush">
                            <thead class="thead-light">
                            <tr>
                                <th>Product Name</th>
                                <th>Category Name</th>
                                <th>Product Code</th>
                                <th>Product Quantity</th>
                                <th>Product Image</th>
                                <th>Buying Price</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="product in filterSearch" :key="product.id">
                                <td>{{ product.product_name }}</td>
                                <td>{{ product.category_name }}</td>
                                <td>{{ product.product_code }}</td>
                                <td>{{ product.product_quantity }}</td>
                                <td><img :src="product.image" id="em_photo" alt=""></td>
                                <td>{{ product.buying_price }}</td>
                                <td v-if="product.product_quantity >= 1">
                                    <span class="badge badge-success">Available</span>
                                </td>
                                <td v-else="">
                                    <span class="badge badge-danger">Out Of Stock</span>
                                </td>
                                <td>
                                    <router-link :to="{name: 'edit-stock', params:{id:product.id}}" class="btn btn-sm btn-primary">Edit</router-link>
                                </td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer"></div>
                </div>
            </div>
        </div>
        <!--Row-->
    </div>
</template>

<script>
export default {
    created() {
        if(!User.loggedIn()){
            this.$router.push({ name: '/' })
        }
    },
    data(){
        return {
            products:[],
            searchTerm:'',
        }
    },
    computed:{
        filterSearch(){
            return this.products.filter(product => {
                // return employee.phone.match(this.searchTerm)
                return product.product_name.match(this.searchTerm)
                // return employee.salary.match(this.searchTerm)
            })
        }
    },


    methods:{
        allProduct(){
            axios.get('/api/product/')
                .then(({ data }) => (this.products = data ))
                .catch()
        },
    },
    // mounted(){
    //     this.allEmployee();
    // }
    created(){
        this.allProduct();
    }
}
</script>

<style scoped>
#em_photo{
    height: 40px;
    width: 40px;
}
</style>
