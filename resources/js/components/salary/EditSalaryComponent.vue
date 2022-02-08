<template>
    <div>
        <div>
            <router-link to="/all-salary" class="btn btn-outline-primary">Go Back</router-link>
        </div>
        <div class="row justify-content-center">
            <div class="col-xl-12 col-lg-12 col-md-12">
                <div class="card shadow-sm my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="login-form">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Update Employee Salary</h1>
                                    </div>
                                    <form class="user" @submit.prevent="salaryUpdate">
                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <label for=""><b>Name</b></label>
                                                    <input type="text" v-model="form.name" class="form-control" id="exampleInputFirstName" placeholder="Enter Your Name">
                                                    <span class="text-danger" v-if="errors.name">{{ errors.name[0] }}</span>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for=""><b>Email</b></label>
                                                    <input type="email" v-model="form.email" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp"
                                                           placeholder="Enter Email Address">
                                                    <span class="text-danger" v-if="errors.email">{{ errors.email[0] }}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <label for="exampleFormControlSelect1"><b>Months</b></label>
                                                    <select class="form-control" id="exampleFormControlSelect1" v-model="form.salary_month">
                                                        <option value="January">January</option>
                                                        <option value="February">February</option>
                                                        <option value="March">March</option>
                                                        <option value="April">April</option>
                                                        <option value="May">May</option>
                                                        <option value="June">June</option>
                                                        <option value="July">July</option>
                                                        <option value="August"> August</option>
                                                        <option value="September">September</option>
                                                        <option value="October">October</option>
                                                        <option value="November">November</option>
                                                        <option value="December">December</option>
                                                    </select>
                                                    <small class="text-danger" v-if="errors.salary_month">{{ errors.salary_month[0] }}</small>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for=""><b>Salary</b></label>
                                                    <input type="hidden" v-model="form.employee_id">
                                                    <input type="text" v-model="form.amount" class="form-control"  aria-describedby="emailHelp"
                                                           placeholder="Enter Your Salary">
                                                    <span class="text-danger" v-if="errors.amount">{{ errors.amount[0] }}</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary btn-block">Update Salary</button>
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
    name: "EditSalaryComponent",
    data(){
        return {
            form:{
                name:'',
                email:'',
                salary_month:'',
                amount:'',
                employee_id:'',
            },
            errors:{

            }
        }
    },
    created(){
        let id = this.$route.params.id
        axios.get('/api/salary/edit/'+id)
            .then( ( {data} ) => (this.form = data))
            .catch(console.log('error'))

    },
    methods:{
        salaryUpdate(){
            // alert('hello')
            let id = this.$route.params.id
            axios.post('/api/salary/update/'+id, this.form)
                .then(() => {
                    this.$router.push({ name: 'all-salary' })
                    Notification.success()
                })
                // .catch(error => this.errors = error.response.data.errors)

                .catch( error => this.errors = error.response.data.errors )
                .catch(
                    Notification.error()

                )
        },

    }

}
</script>

<style scoped>

</style>
