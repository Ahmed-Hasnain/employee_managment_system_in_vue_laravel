<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Backend\UserController;
use App\Http\Controllers\Backend\ChangePasswordController;
use App\Http\Controllers\Backend\CountryController;
use App\Http\Controllers\Backend\StateController;
use App\Http\Controllers\Backend\CityController;
use App\Http\Controllers\Backend\DepartmentController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home')->middleware('auth');
Route::resource('user', UserController::class)->middleware('auth');
Route::resource('countries', CountryController::class)->middleware('auth');
Route::resource('states', StateController::class)->middleware('auth');
Route::resource('cities', CityController::class)->middleware('auth');
Route::resource('departments', DepartmentController::class)->middleware('auth');

Route::post('user/{user}/change-password',[ChangePasswordController::class,'changePassword'])->name('users.change.password')->middleware('auth');

//Employee Management Routes / Vue js Routes
Route::get('{any}',function () {
    return view('employees.index');
})->where('any','.*')->middleware('auth');

