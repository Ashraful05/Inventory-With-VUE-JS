import LoginComponent from "./components/auth/LoginComponent";
import RegisterComponent from "./components/auth/RegisterComponent";
import ForgetPasswordComponent from "./components/auth/ForgetPasswordComponent";
import HomeComponent from "./components/HomeComponent";
import LogOutComponent from "./components/auth/LogOutComponent";
import CreateEmployeeComponent from "./components/Employee/CreateEmployeeComponent";
import AllEmployeeComponent from "./components/Employee/AllEmployeeComponent";
import EditEmployeeComponent from "./components/Employee/EditEmployeeComponent";
import CreateSupplierComponent from "./components/Supplier/CreateSupplierComponent";
import AllSupplierComponent from "./components/Supplier/AllSupplierComponent";
import EditSupplierComponent from "./components/Supplier/EditSupplierComponent";
import CreateCategoryComponent from "./components/Category/CreateCategoryComponent";
import AllCategoryComponent from "./components/Category/AllCategoryComponent";
import EditCategoryComponent from "./components/Category/EditCategoryComponent";
import CreateProductComponent from "./components/Product/CreateProductComponent";
import AllProductComponent from "./components/Product/AllProductComponent";
import EditProductComponent from "./components/Product/EditProductComponent";
import CreateExpenseComponent from "./components/Expense/CreateExpenseComponent";
import AllExpenseComponent from "./components/Expense/AllExpenseComponent";
import EditExpenseComponent from "./components/Expense/EditExpenseComponent";
import AddSalaryComponent from "./components/salary/AddSalaryComponent";
import AllSalaryComponent from "./components/salary/AllSalaryComponent";
import EmployeeForSalaryComponent from "./components/salary/EmployeeForSalaryComponent";
import PaySalaryComponent from "./components/salary/ViewSalaryComponent";
import EditSalaryComponent from "./components/salary/EditSalaryComponent";
import StockComponent from "./components/stock/StockComponent";
import EditStockComponent from "./components/stock/EditStockComponent";
import CreateCustomerComponent from "./components/Customer/CreateCustomerComponent";
import AllCustomerComponent from "./components/Customer/AllCustomerComponent";
import EditCustomerComponent from "./components/Customer/EditCustomerComponent";
import PosComponent from './components/POS/PosComponent';
import OrderComponent from "./components/orders/OrderComponent";
import ViewOrderComponent from "./components/orders/ViewOrderComponent";
import SearchOrderComponent from "./components/orders/SearchOrderComponent";


let login = require('./components/auth/LoginComponent.vue').default;
let register = require('./components/auth/RegisterComponent').default;
let home = require('./components/HomeComponent').default;
let logout = require('./components/auth/LogOutComponent').default;
let forgetPassword = require('./components/auth/ForgetPasswordComponent').default;

//employeee component
let createEmployee = require('./components/Employee/CreateEmployeeComponent').default;
let allEmployee = require('./components/Employee/AllEmployeeComponent').default;
let editEmployee = require('./components/Employee/EditEmployeeComponent').default;

//supplier component
let createSupplier = require('./components/Supplier/CreateSupplierComponent').default;
let allSupplier = require('./components/Supplier/AllSupplierComponent').default;
let editSupplier = require('./components/Supplier/EditSupplierComponent').default;

//Category Component....
let createCategory = require('./components/Category/CreateCategoryComponent').default;
let allCategory = require('./components/Category/AllCategoryComponent').default;
let editCategory = require('./components/Category/EditCategoryComponent').default;

//product component.....
let createProduct = require('./components/Product/CreateProductComponent').default;
let allProduct = require('./components/Product/AllProductComponent').default;
let editProduct = require('./components/Product/EditProductComponent').default;

//expense component....
let createExpense = require('./components/Expense/CreateExpenseComponent').default;
let allExpense = require('./components/Expense/AllExpenseComponent').default;
let editExpense = require('./components/Expense/EditExpenseComponent').default;

//salary component..........
let Salary = require('./components/salary/EmployeeForSalaryComponent').default;
let paySalary = require('./components/salary/AddSalaryComponent').default;
let allSalary = require('./components/salary/AllSalaryComponent').default;
let viewSalary = require('./components/salary/ViewSalaryComponent').default;
let editSalary = require('./components/salary/EditSalaryComponent').default;

//stock component...
let stock = require('./components/stock/StockComponent').default;
let editStock = require('./components/stock/EditStockComponent').default;

//customer component....
let addCustomer = require('./components/Customer/CreateCustomerComponent').default;
let allCustomer = require('./components/Customer/AllCustomerComponent').default;
let editCustomer = require('./components/Customer/EditCustomerComponent').default;

//pos component...
let pos = require('./components/POS/PosComponent').default;

export const routes = [
    { path: '/', component: LoginComponent, name:'/' },
    { path: '/register', component: RegisterComponent, name:'register' },
    { path: '/forget-password', component: ForgetPasswordComponent, name:'forgetPassword'},
    { path: '/home', component: HomeComponent, name:'home'},
    { path: '/logout', component: LogOutComponent, name: 'logout'},

    // Employee route.......
    { path: '/add-employee', component: CreateEmployeeComponent, name: 'add-employee'},
    { path: '/all-employee', component: AllEmployeeComponent, name: 'all-employee'},
    { path: '/edit-employee/:id', component: EditEmployeeComponent, name: 'edit-employee'},

    //Supplier route......
    { path: '/add-supplier', component: CreateSupplierComponent, name: 'add-supplier'},
    { path: '/all-supplier', component: AllSupplierComponent, name: 'all-supplier'},
    { path: '/edit-supplier/:id', component: EditSupplierComponent, name: 'edit-supplier' },

    //Category route......
    { path: '/add-category', component: CreateCategoryComponent, name: 'add-category' },
    { path: '/all-category', component: AllCategoryComponent, name: 'all-category' },
    { path: '/edit-category/:id', component: EditCategoryComponent, name: 'edit-category' },

    //Product route...
    { path: '/add-product', component: CreateProductComponent, name: 'add-product'},
    { path: '/all-product', component: AllProductComponent, name: 'all-product'},
    { path: '/edit-product/:id', component: EditProductComponent, name: 'edit-product' },

    //Expense route...
    { path: '/add-expense', component: CreateExpenseComponent, name: 'add-expense' },
    { path: '/all-expense', component: AllExpenseComponent, name: 'all-expense' },
    { path: '/edit-expense/:id', component: EditExpenseComponent, name: 'edit-expense'},

    //salary route...
    { path: '/given-salary', component:Salary , name: 'given-salary'},
    { path: '/pay-salary/:id', component: paySalary, name: 'pay-salary'},

    { path: '/all-salary', component: allSalary, name: 'all-salary' },
    { path: '/view-salary/:id', component: viewSalary, name: 'view-salary'},
    { path: '/edit-salary/:id', component: editSalary, name: 'edit-salary'},

    //stock route....
    { path: '/stock', component: StockComponent, name: 'stock'},
    { path: '/edit-stock/:id', component: EditStockComponent, name: 'edit-stock'},

    // Customer route.......
    { path: '/add-customer', component: CreateCustomerComponent, name: 'add-customer'},
    { path: '/all-customer', component: AllCustomerComponent, name: 'all-customer'},
    { path: '/edit-customer/:id', component: EditCustomerComponent, name: 'edit-customer'},

    // pos route...
    { path: '/pos', component: PosComponent, name: 'pos'},

    // order route....
    { path: '/order', component: OrderComponent, name: 'order' },
    { path: '/view-order/:id', component: ViewOrderComponent, name: 'view-order' },
    { path: '/search-order', component: SearchOrderComponent, name: 'search-order' },

]
