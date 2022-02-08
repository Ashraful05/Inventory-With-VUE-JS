<template>
    <div>
        <div>
            <router-link to="/all-expense" class="btn btn-outline-primary">All Expense</router-link>
        </div>
        <div class="row justify-content-center">
            <div class="col-xl-12 col-lg-12 col-md-12">
                <div class="card shadow-sm my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="login-form">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Update Expense</h1>
                                    </div>
                                    <form class="user" @submit.prevent="updateExpense">
                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col-md-12">
                                                    <label for=""><b>Expense Details</b></label>
                                                    <textarea type="text" v-model="form.details" class="form-control"  rows=""></textarea>
                                                    <span class="text-danger" v-if="errors.details">{{ errors.details[0] }}</span>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="form-row">
                                                <div class="col-md-12">
                                                    <label for=""><b>Expense Amount</b></label>
                                                    <input type="text" v-model="form.amount" class="form-control">
                                                    <span class="text-danger" v-if="errors.amount">{{ errors.amount[0] }}</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary btn-block">Update Category</button>
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
    name: "EditExpenseComponent",
    data(){
        return {
            form:{
                details:'',
                amount:''
            },
            errors:{},
        }
    },
    created(){
        let id = this.$route.params.id
        axios.get('/api/expense/'+id)
            .then( ( {data} ) => (this.form = data))
            .catch(console.log('error'))

    },
    methods:{
        updateExpense(){
            // alert('hello')
            let id = this.$route.params.id
            axios.patch('/api/expense/'+id, this.form)
                .then(() => {
                    this.$router.push({ name: 'all-expense' })
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
