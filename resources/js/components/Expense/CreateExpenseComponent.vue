<template>
    <div>
        <div>
            <router-link to="all-expense" class="btn btn-outline-primary">All Expense</router-link>
        </div>
        <div class="row justify-content-center">
            <div class="col-xl-12 col-lg-12 col-md-12">
                <div class="card shadow-sm my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="login-form">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Add Expense</h1>
                                    </div>
                                    <form class="user" @submit.prevent="addExpense">
                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col-md-12">
                                                    <textarea type="text" class="form-control" v-model="form.details" id="exampleFormControlTextarea1" rows=""></textarea>
                                                    <span class="text-danger" v-if="errors.details">{{ errors.details[0] }}</span>
                                                </div>
                                            </div>
                                        </div>
                                            <br>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-12">
                                                        <input type="text" v-model="form.amount" class="form-control" placeholder="Enter Expense Amount">
                                                        <span class="text-danger" v-if="errors.amount">{{ errors.amount[0] }}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary btn-block">Submit Expense</button>
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
    name: "CreateExpenseComponent",
    data(){
        return {
            form:{
                details:null,
                amount:null,
            },
            errors:{

            }
        }
    },
    methods:{
        addExpense(){
            // alert('hello')
            axios.post('/api/expense',this.form)
                .then(() =>{
                    this.$router.push({ name: 'all-expense' })
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
