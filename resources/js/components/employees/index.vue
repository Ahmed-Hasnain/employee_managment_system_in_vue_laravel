<template>
    <div class="card">
    <div>
       
            <div v-if="showMessage" class="alert alert-success">
              <h5>{{ message }}</h5>
            </div>
       
    </div>
    <div class="card-header">
        <form method="GET" action="">
            <div class="form-row float-left">
              <div class="col-auto">
                <label class="sr-only" for="inlineFormInput">Name</label>
                <input type="search" class="form-control mb-2" v-model="search" placeholder="Search countries by country name">
                
              </div>

              <div class="col-auto">
                <select class="form-control" name="department" v-model="selectedDepartmentId">
                        <option :value="0"> </option>
                        <option v-for="department in departments" :key="department.id" :value="department.id"  >{{ department.name }}</option>
                    </select>
              </div>

              <div class="col-auto">
                <button type="submit" class="btn btn-primary mb-2">Submit</button>
              </div>
            </div>
          </form>
          <router-link :to="{name: 'EmployeesCreate'}" class="btn btn-primary float-right">Create</router-link>
        
    </div>
    <div class="card-body">
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">First name</th>
                <th scope="col">Last name</th>
                <th scope="col">Department</th>
                <th scope="col">Address</th>
                <th scope="col">DOB</th>
                <th scope="col">Manage</th>
                
            </tr>
            </thead>
            <tbody>
           
            <tr v-for="employee in employees" :key="employee.id">
                <th scope="row">{{ employee.id }}</th>
                <td>{{ employee.first_name }}</td>
                <td>{{ employee.last_name }}</td>
                <td>{{ employee.department.name }}</td>
                <td>{{ employee.address }}</td>
                <td>{{ employee.birthdate }}</td>
                <td>
                    <router-link :to="{name: 'EmployeesEdit', params:{id: employee.id}}" class="btn btn-success ">Edit</router-link>
                    <button class="btn btn-danger" @click="deleteEmployee(employee.id)">Delete</button>
                    
                    
                </td>
            </tr>
           
            </tbody>
        </table>
    </div>
    
</div>
</template>

<script>
export default {
    name:'index',
    data(){
        return{
            employees : [],
            showMessage: false,
            message: '',
            search:null,
            selectedDepartmentId: null,
            departments:[],
        }
    },
    watch:{
        search(){
            this.getEmployees();
        },
        selectedDepartmentId(){
            this.getEmployees();
        }
    },
    created(){
        this.getEmployees();
        this.getDepartments();
        
    },
    methods:{
        getEmployees(){
            axios.get('/api/employees', {params:{
                search: this.search,
                department_id: this.selectedDepartmentId,
            }})
            .then(response => {
                this.employees = response.data.data;
                console.log(this.employees);
            })
            .catch(errors => {
                console.log(errors);
            })
        },
        deleteEmployee(id){
            axios.delete('/api/employees/'+id)
            .then(response => {
                this.getEmployees();
                this.showMessage = true;
                this.message = response.data.message;
                console.log(response);
            })
        },
        getDepartments(){
          axios.get("/api/employees/departments")
          .then(response  => {
              this.departments = response.data.departments;  
              console.log(this.departments);
          })
          .catch(errors => {
              console.log(errors);
          })
      },
    },
    mounted(){
        if (this.$route.query.message) {
            this.showMessage = true;
            this.message = this.$route.query.message;
        }
        console.log(this.message);
    }
 
}
</script>

<style>

</style>