<template>

    <div>
        <div>
            <router-link to="all-salary" class="btn btn-primary">All Salary</router-link>
        </div>
        <br>
        <input type="name" class="form-control" v-model="searchTerm" style="width: 300px;" placeholder="search...">
        <br>
        <div class="row">
            <div class="col-lg-12 mb-4">
                <!-- Simple Tables -->
                <div class="card">
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Employee List</h6>
                    </div>
                    <div class="table-responsive">
                        <table class="table align-items-center table-flush">
                            <thead class="thead-light">
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Photo</th>
                                <th>Salary</th>
                                <th>Joining Date</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="employee in filterSearch" :key="employee.id">
                                <td>{{ employee.name }}</td>
                                <td>{{ employee.email }}</td>
                                <td>{{ employee.phone}}</td>
                                <td><img :src="employee.photo" id="em_photo" alt=""></td>
                                <td>{{ employee.salary }}</td>
                                <td>{{ employee.joining_date }}</td>
                                <td>
                                    <router-link :to="{name: 'pay-salary', params:{id:employee.id}}" class="btn btn-sm btn-primary">Pay Salary</router-link>
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
            employees:[],
            searchTerm:'',
        }
    },
    computed:{
        filterSearch(){
            return this.employees.filter(employee => {
                // return employee.phone.match(this.searchTerm)
                return employee.name.match(this.searchTerm)
                // return employee.salary.match(this.searchTerm)
            })
        }
    },


    methods:{
        allEmployee(){
            axios.get('/api/employee/')
                .then(({ data }) => (this.employees = data ))
                .catch()
        },

    },
    // mounted(){
    //     this.allEmployee();
    // }
    created(){
        this.allEmployee();
    }
}
</script>

<style scoped>
#em_photo{
    height: 40px;
    width: 40px;
}
</style>
