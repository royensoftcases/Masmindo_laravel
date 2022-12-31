<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/register', App\Http\Controllers\Api\RegisterController::class)->name('register');

Route::post('/login', App\Http\Controllers\Api\LoginController::class)->name('login');

Route::post('/logout', App\Http\Controllers\Api\LogoutController::class)->name('logout');

Route::middleware('auth:api')->get('/contact', [App\Http\Controllers\Api\ContactController::class, 'getAllContact']);

Route::middleware('auth:api')->post('/storecontact', 'App\Http\Controllers\Api\CrudController@store');

Route::middleware('auth:api')->post('/updatecontact', 'App\Http\Controllers\Api\CrudController@update');

Route::middleware('auth:api')->post('/destroycontact', 'App\Http\Controllers\Api\CrudController@destroy');


Route::get('/contact_tes', [App\Http\Controllers\Api\ContactController::class, 'getAllContact']);

Route::group(['middleware' => 'web'], function() {
    Route::resource('tes', 'TesController');
});
