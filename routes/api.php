<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\API\EmployeeController;
use App\Http\Controllers\API\SupplierController;
use App\Http\Controllers\API\CategoryController;
use App\Http\Controllers\API\ProductController;
use App\Http\Controllers\API\ExpenseController;
use App\Http\Controllers\API\SalaryController;
use App\Http\Controllers\API\CustomerController;
use App\Http\Controllers\API\POSController;
use App\Http\Controllers\API\CartController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//Route::group([
//
//    'middleware' => 'api',
//    'namespace' => 'App\Http\Controllers',
//    'prefix' => 'auth'
//
//], function ($router) {
////    Route::post('signup',[AuthController::class,'register']);
//    Route::post('signup',[AuthController::class,'register']);
//    Route::post('login', 'AuthController@login');
//    Route::post('logout', 'AuthController@logout');
//    Route::post('refresh', 'AuthController@refresh');
//    Route::post('me', 'AuthController@me');
//
//});


Route::post('register',[AuthController::class,'register']);
Route::post('login',[AuthController::class,'login']);
Route::post('logout',[AuthController::class,'logout']);
Route::post('refresh',[AuthController::class,'refresh']);
Route::post('me',[AuthController::class,'me']);

//Route::post('signup',[AuthController::class,'register']);
//Route::post('login',[AuthController::class,'login']);
//Route::group(['middleware'=>['auth:api']],function(){
//    Route::post('logout',[AuthController::class,'logout']);
//    Route::post('refresh',[AuthController::class,'refresh']);
//    Route::post('me',[AuthController::class,'me']);
//});

Route::apiResource('/employee',EmployeeController::class);
Route::apiResource('/supplier',SupplierController::class);
Route::apiResource('/category',CategoryController::class);
Route::apiResource('/product',ProductController::class);
Route::apiResource('/expense',ExpenseController::class);
Route::apiResource('/customer',CustomerController::class);

Route::post('/salary/paid/{id}',[SalaryController::class,'paidSalary']);
Route::get('/salary',[SalaryController::class,'allSalary']);
Route::get('/salary/view/{id}',[SalaryController::class,'viewSalary']);
Route::get('/salary/edit/{id}',[SalaryController::class,'editSalary']);
Route::post('/salary/update/{id}',[SalaryController::class,'updateSalary']);

Route::post('/stock/update/{id}',[ProductController::class,'updateStock']);

Route::get('/getting/product/{id}',[POSController::class,'getProduct']);

//Add to cart route.....
Route::get('/add-to-cart/{id}',[CartController::class,'AddToCart']);
Route::get('/cart/product',[CartController::class,'cartProduct']);
Route::get('/remove/cart/{id}',[CartController::class,'cartRemove']);
Route::get('/increment/{id}',[CartController::class,'cartIncrement']);
Route::get('/decrement/{id}',[CartController::class,'cartDecrement']);

//vat route......
Route::get('/vats',[CartController::class,'Vats']);

Route::post('/orderdone',[POSController::class,'orderDone']);

Route::get('/orders',[\App\Http\Controllers\API\OrderController::class,'todaysOrder']);
Route::get('/order/details/{id}',[\App\Http\Controllers\API\OrderController::class,'orderDetails']);
Route::get('/order/order-details/{id}',[\App\Http\Controllers\API\OrderController::class,'orderDetailsAll']);

Route::post('/search/order',[POSController::class,'searchOrderByDate']);
// Admin Dashboard route....
Route::get('/today/sale',[POSController::class,'todaySale']);
Route::get('/today/income',[POSController::class,'todayIncome']);
Route::get('/today/due',[POSController::class,'todayDue']);
Route::get('/today/expense',[POSController::class,'todayExpense']);
Route::get('/today/stock-out',[POSController::class,'todayStockOut']);

