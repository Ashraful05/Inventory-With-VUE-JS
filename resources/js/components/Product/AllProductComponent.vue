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
                                <th>Supplier Name</th>
                                <th>Root</th>
                                <th>Product Code</th>
                                <th>Product Quantity</th>
                                <th>Product Image</th>
                                <th>Buying Price</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="product in filterSearch" :key="product.id">
                                <td>{{ product.product_name }}</td>
                                <td>{{ product.category_name }}</td>
                                <td>{{ product.name }}</td>
                                <td>{{ product.root}}</td>
                                <td>{{ product.product_code }}</td>
                                <td>{{ product.product_quantity }}</td>
                                <td><img :src="product.image" id="em_photo" alt=""></td>
                                <td>{{ product.buying_price }}</td>
                                <td>
                                    <router-link :to="{name: 'edit-product', params:{id:product.id}}" class="btn btn-sm btn-primary">Edit</router-link>
                                    <a @click="deleteProduct(product.id)" class="btn btn-sm btn-danger">Delete</a>
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
        deleteProduct(id){
            Swal.fire({
                title: 'Are you sure?',
                text: "You want to delete this Product!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    axios.delete('/api/product'+'/'+id)
                        .then(() => {
                            this.products = this.products.filter(product => {
                                return product.id != id
                            })
                        })
                        .catch(() => {
                            this.$router.push({name: 'all-product'})
                        })
                    Swal.fire(
                        'Deleted!',
                        'Your file has been deleted.',
                        'success'
                    )
                }
            })
        }
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
