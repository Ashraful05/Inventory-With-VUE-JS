<template>
    <div>
        <div class="container-fluid" id="container-wrapper">
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">POS Dashboard</h1>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="./">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">POS</li>
                </ol>
            </div>

            <div class="row mb-3">

                <!-- Area Chart -->
                <div class="col-xl-8 col-lg-5">
                    <div class="card mb-4">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Expense Insert</h6>
                            <a class="btn btn-sm btn-info"><font color="#f0ffff">Add Customer</font></a>
                        </div>
                        <div class="table-responsive">
                            <table class="table align-items-center table-flush" style="font-size: 12px;">
                                <thead class="thead-light">
                                <tr>
                                    <th>Name</th>
                                    <th>Quantity</th>
                                    <th>Unit Price</th>
                                    <th>Total</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="cart in carts" :key="cart.id">
                                    <td>{{cart.pro_name}}</td>
                                    <td><input type="text" style="width: 14px;" readonly :value="cart.pro_quantity">
                                        <button @click.prevent="increment(cart.id)" class="btn btn-sm btn-success">+</button>
                                        <button @click.prevent="decrement(cart.id)" class="btn btn-sm btn-danger" v-if="cart.pro_quantity >=2 ">-</button>
                                        <button class="btn btn-sm btn-danger" v-else="" disabled>-</button>
                                    </td>
                                    <td>{{cart.pro_price}}</td>
                                    <td>{{ cart.sub_total }}</td>
                                    <td><a @click="removeCartItem(cart.id)" class="btn btn-sm btn-danger">X</a></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="card-footer">
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between
                                align-items-center">Total Quantity: <strong>{{ qty }}</strong></li>
                                <li class="list-group-item d-flex justify-content-between
                                align-items-center">Sub Total: <strong>{{ subtotal }} $</strong></li>
                                <li class="list-group-item d-flex justify-content-between
                                align-items-center">Vat: <strong>{{ vats.vat }} %</strong></li>
                                <li class="list-group-item d-flex justify-content-between
                                align-items-center">Total Amount: <strong>{{ subtotal*vats.vat /100 + subtotal }} $</strong></li>
                            </ul>
                            <br>
                            <form action="" @submit.prevent="orderDone">
                                <label for="">Customer Name</label>
                                <select class="form-control" v-model="customer_id">
                                    <option :value="customer.id" v-for="customer in customers">{{customer.name}}</option>
                                </select>
                                <label for="">Pay</label>
                                <input type="text" v-model="pay" class="form-control" required>
                                <label for="">Due</label>
                                <input type="text" v-model="due" class="form-control" required>
                                <label for="">Pay By:</label>
                                <select class="form-control" v-model="pay_by">
                                    <option value="handcash">HandCash</option>
                                    <option value="cheque">Cheque</option>
                                    <option value="giftcard">GiftCard</option>
                                </select><br>
                                <button type="submit" class="btn btn-block btn-outline-success">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- Pie Chart -->
                <div class="col-xl-4 col-lg-7">
                    <div class="card mb-4">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Products Sold</h6>
                        </div>
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab"
                                    aria-controls="home" aria-selected="true">All Product</a>
                            </li>
                            <li class="nav-item" role="presentation" v-for="category in categories" :key="category.id">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false"
                                   @click="subProduct(category.id)">{{ category.category_name }}</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <div class="card-body">
                                    <input type="text" class="form-control" v-model="searchTerm" style="width: 300px;"
                                           placeholder="Search Product...">
                                    <br>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-6" v-for="product in filterSearch" :key="product.id">
                                            <button class="btn btn-sm" @click="addToCart(product.id)">
                                                <div class="card" style="width: 10rem;">
                                                    <img :src="product.image" id="em_photo" class="card-img-top" alt="">
                                                    <div class="card-body">
                                                        <h6 class="card-title">{{ product.product_name }}</h6>
                                                        <span class="badge badge-success" v-if="product.product_quantity >= 1">Available {{ product.product_quantity }} </span>
                                                        <span class="badge badge-danger" v-else="">Stock Out</span>
                                                    </div>
                                                </div>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <div class="card-body">
                                    <input type="text" class="form-control" v-model="searchTerm" style="width: 300px;" placeholder="Search Product...">
                                    <br>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-6" v-for="getProduct in getFilterSearch" :key="getProduct.id">
                                            <button class="btn btn-sm" @click.prevent="addToCart(getProduct.id)">
                                                <div class="card" style="width: 10rem;">
                                                    <img :src="getProduct.image" id="em_photo" class="card-img-top" alt="">
                                                    <div class="card-body">
                                                        <h6 class="card-title">{{ getProduct.product_name }}</h6>
                                                        <span class="badge badge-success" v-if="getProduct.product_quantity >= 1">Available {{ getProduct.product_quantity }} </span>
                                                        <span class="badge badge-danger" v-else="">Stock Out</span>
                                                    </div>
                                                </div>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <!--Row-->

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
    created(){
        this.allProduct();
        this.allCategory();
        this.allCustomer();
        this.cartProduct();
        this.vat();
        Reload.$on('AfterAdd',() => {
            this.cartProduct();
        })

        //subProduct function should be in last...else it will not work.......
        this.subProduct(id);

    },
    data(){
        return {
            customer_id:'',
            pay:'',
            due:'',
            pay_by:'',
            products:[],
            categories:'',
            getProducts:[],
            carts:[],
            customers:'',
            searchTerm:'',
            getSearchTerm:'',
            errors: '',
            vats:'',

        }
    },
    computed:{
        filterSearch(){
            return this.products.filter(product => {
                // return employee.phone.match(this.searchTerm)
                return product.product_name.match(this.searchTerm)
                // return employee.salary.match(this.searchTerm)
            })
        },
        getFilterSearch(){
            return this.getProducts.filter(getProduct => {
                return getProduct.product_name.match(this.getSearchTerm)
            })
        },
        qty(){
           let sum = 0;
           for(let i=0; i<this.carts.length; i++){
                sum = sum + (parseFloat(this.carts[i].pro_quantity));
           }
           return sum;
        },
        subtotal(){
            let sum = 0;
            for(let i=0; i<this.carts.length; i++){
                sum = sum + (parseFloat(this.carts[i].pro_quantity) * parseFloat(this.carts[i].pro_price));
            }
            return sum;
        },
    },


    methods:{
        // Cart Method.........
        addToCart(id){
            axios.get('/api/add-to-cart/'+id)
                .then(() => {
                    Reload.$emit('AfterAdd')
                    Notification.cartSuccess();
                })
                .catch()
        },
        cartProduct(){
            axios.get('/api/cart/product')
                .then(({ data })=>(this.carts = data))
                .catch()
        },
        removeCartItem(id){
            axios.get('/api/remove/cart/'+id)
                .then(() => {
                    Reload.$emit('AfterAdd');
                    Notification.cartDelete();
                })
        },
        increment(id){
            axios.get('/api/increment/'+id)
            .then(()=> {
                Reload.$emit('AfterAdd');
                Notification.success()
            })
            .catch()
        },
        decrement(id){
            axios.get('/api/decrement/'+id)
            .then(()=>{
                Reload.$emit('AfterAdd');
                Notification.success()
            })
            .catch()
        },
        vat(){
          axios.get('/api/vats/')
          .then(({data}) => (this.vats = data))
          .catch()
        },
        orderDone(){
            let total = this.subtotal*this.vats.vat /100 + this.subtotal;
            var data = { qty:this.qty, subtotal:this.subtotal, customer_id:this.customer_id,
                pay_by:this.pay_by, pay:this.pay, due:this.due, vat:this.vats.vat, total:total }
            axios.post('/api/orderdone',data)
            .then(()=> {
                Notification.success()
                // this.$router.push({name: 'home'})
            })
        },
        //End Cart Method.......
        allProduct(){
            axios.get('/api/product/')
                .then(({ data }) => (this.products = data ))
                .catch()
        },
        allCategory(){
            axios.get('/api/category/')
            .then(({ data }) => (this.categories = data ))
            .catch()
        },
        allCustomer(){
            axios.get('/api/customer/')
                .then(({ data }) => (this.customers = data))
                .catch(console.log('error'))
        },

        subProduct(id){
            axios.get('/api/getting/product/'+id)
            .then(({ data }) => (this.getProducts = data))
            .catch()
        },

    },
}
</script>

<style scoped>
#em_photo{
    height: 100px;
    width: 135px;
}
</style>
