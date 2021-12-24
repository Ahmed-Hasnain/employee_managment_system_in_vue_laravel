<template>
  <div>
      <div class="card">
    <div class="card-header">
        Create Employee
        <router-link :to="{name: 'EmployeesIndex'}" class="float-right btn btn-primary">Back To Employee List</router-link>
    </div>

    <div class="card-body">
        <form @submit.prevent="storeEmployee">

            <div class="row mb-3">
                <label for="first_name" class="col-md-4 col-form-label text-md-right">First Name</label>

                <div class="col-md-6">
                    <input id="first_name" v-model="form.first_name" type="text" class="form-control" name="first_name" value="" required autocomplete="first_name" autofocus>

                   
                        <span class="invalid-feedback" role="alert">
                            <strong></strong>
                        </span>
                   
                </div>
            </div>
            
            <div class="row mb-3">
                <label for="last_name" class="col-md-4 col-form-label text-md-right">Last Name</label>

                <div class="col-md-6">
                    <input id="last_name" v-model="form.last_name" type="text" class="form-control" name="last_name" value="" required autocomplete="last_name" autofocus>

                   
                        <span class="invalid-feedback" role="alert">
                            <strong></strong>
                        </span>
                   
                </div>
            </div>

            <div class="row mb-3">
                <label for="middle_name" class="col-md-4 col-form-label text-md-right">Middle Name</label>

                <div class="col-md-6">
                    <input id="middle_name" v-model="form.middle_name" type="text" class="form-control" name="middle_name" value="" required autocomplete="middle_name" autofocus>

                   
                        <span class="invalid-feedback" role="alert">
                            <strong></strong>
                        </span>
                   
                </div>
            </div>

            <div class="row mb-3">
                <label for="address" class="col-md-4 col-form-label text-md-right">Address</label>

                <div class="col-md-6">
                    <input id="address" v-model="form.address" type="text" class="form-control" name="address" value="" required autocomplete="address" autofocus>

                   
                        <span class="invalid-feedback" role="alert">
                            <strong></strong>
                        </span>
                   
                </div>
            </div>

            <div class="row mb-3">
                <label for="country" class="col-md-4 col-form-label text-md-right">Country</label>

                <div class="col-md-6">
                    <select class="form-control" name="country" v-model="form.country_id" @change="getStates()">
                        <option selected>Select Country</option>
                        <option v-bind:value=" country.id " v-for="country in countries" :key="country.id"> {{ country.name    }}</option>
                    </select>
                </div>

            </div>

            <div class="row mb-3">
                <label for="state" class="col-md-4 col-form-label text-md-right">State</label>

                <div class="col-md-6">
                    <select class="form-control" name="state" v-model="form.state_id" @change="getCities()">
                        <option v-bind:value=" state.id " v-for="state in states" :key="state.id">{{ state.name}}</option>
                    </select>
                </div>

            </div>

            <div class="row mb-3">
                <label for="city" class="col-md-4 col-form-label text-md-right" >City</label>

                <div class="col-md-6">
                    <select class="form-control"  name="city" v-model="form.city_id" >
                        <option v-bind:value=" city.id " v-for="city in cities" :key="city.id">{{ city.name}}</option>
                    </select>
                </div>

            </div>

            <div class="row mb-3">
                <label for="department" class="col-md-4 col-form-label text-md-right">Department</label>

                <div class="col-md-6">
                    <select class="form-control" name="department" v-model="form.department_id">
                        <option v-for="department in departments" :key="department.id" :value="department.id">{{ department.name }}</option>
                    </select>
                </div>

            </div>

            <div class="row mb-3">
                <label for="zip_code" class="col-md-4 col-form-label text-md-right">Zip Code</label>

                <div class="col-md-6">
                    <input id="zip_code" v-model="form.zip_code" type="text" class="form-control" name="zip_code" value="" required autocomplete="zip_code" autofocus>

                   
                        <span class="invalid-feedback" role="alert">
                            <strong></strong>
                        </span>
                   
                </div>
            </div>

            <div class="row mb-3">
                <label for="birthdate" class="col-md-4 col-form-label text-md-right">BIRTHDATE</label>

                <div class="col-md-6">
                    <datepicker input-class="form-control" v-model="form.birthdate"></datepicker>

                   
                        <span class="invalid-feedback" role="alert">
                            <strong></strong>
                        </span>
                   
                </div>
            </div>

            <div class="row mb-3 form-group">
                <label for="date_hired" class="col-md-4 col-form-label text-md-right">Hired Date</label>

                <div class="col-md-6 ">
                    <datepicker input-class="form-control" v-model="form.date_hired"></datepicker>

                        <span class="invalid-feedback" role="alert">
                            <strong></strong>
                        </span>
                   
                </div>
            </div>

            <div class="row mb-0">
                <div class="col-md-6 offset-md-4">
                    <button type="submit" class="btn btn-primary">
                        Store 
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
  </div>
</template>

<script>
import Datepicker from 'vuejs-datepicker';
import moment from "moment";

export default {
     components: {
        Datepicker,
  },
  data(){
      return{
          countries:[],
          states:[],
          cities:[],
          departments:[],
          form: {
              first_name:'',
              last_name:'',
              middle_name:'',
              address:'',
              birthdate:null,
              date_hired:null,
              zip_code:'',
              country_id:'',
              state_id:'',
              city_id:'',
              department_id:'',

          }
      }
  },
  methods:{
      getCountries(){
          axios.get('/api/employees/countries')
          .then(response  => {
              this.countries = response.data.countries;
            //   console.log(this.countries);
          })
          .catch(errors => {
              console.log(errors);
          })
      },

      getStates(){
          axios.get("/api/employees/"+ this.form.country_id +"/states")
          .then(response  => {
              this.states = response.data.states;  
            //   console.log(this.states);
          })
          .catch(errors => {
              console.log(errors);
          })
      },
      getCities(){
          axios.get("/api/employees/"+ this.form.state_id +"/cities")
          .then(response  => {
              this.cities = response.data.cities;  
            //   console.log(this.cities);
          })
          .catch(errors => {
              console.log(errors);
          })
      },
      getDepartments(){
          axios.get("/api/employees/departments")
          .then(response  => {
              this.departments = response.data.departments;  
            //   console.log(this.departments);
          })
          .catch(errors => {
              console.log(errors);
          })
      },
      storeEmployee(){
          axios.post('/api/employees/',{
              'first_name': this.form.first_name,
              'last_name': this.form.last_name,
              'middle_name': this.form.middle_name,
              'address': this.form.address,
              'country_id': this.form.country_id,
              'state_id': this.form.state_id,
              'city_id': this.form.city_id,
              'department_id': this.form.department_id,
              'zip_code': this.form.zip_code,
              'birthdate': this.formate_date(this.form.birthdate),
              'date_hired': this.formate_date(this.form.date_hired),
          }).then(response => {
              console.log(response.data.message);
              this.$router.push(
                  {
                      name:"EmployeesIndex",
                      query:
                      {
                        message: response.data.message,
                      },
                  });
              
          })
      },
      formate_date(value){
          if (value) {
              return moment(String(value)).format('YYYYMMDD');
          }
      }

  },
  created(){
      this.getCountries();
      this.getDepartments();
     
  }
}
</script>

<style>

</style>