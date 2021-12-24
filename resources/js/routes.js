import EmployeesIndex from './components/employees/index.vue';
import EmployeesCreate from './components/employees/create.vue';
import EmployeesEdit from './components/employees/edit.vue';

export const routes=[
    {
        path:"/employees",
        name:"EmployeesIndex",
        component:EmployeesIndex
    },
    {
        path:"/employees/create",
        name:"EmployeesCreate",
        component:EmployeesCreate
    },
    {
        path:"/employees/:id",
        name:"EmployeesEdit",
        component:EmployeesEdit
    }
]