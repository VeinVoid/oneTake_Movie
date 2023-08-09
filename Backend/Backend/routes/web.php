<?php

use Illuminate\Support\Facades\Route;
use \App\Http\Requests\MovieRequest;
use \App\Models\Movie;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return redirect()->route('page.list');
});

Route::get('/movie/json', function (Movie $movie){
    $movie = Movie::all();
    return response()->json([
        'success' => true,
        'message' => 'Data retrieved successfully',
        'data' => $movie,
    ]);
});

Route::view('/movie/input', 'pageInput')->name('page.input');

Route::get('/movie/{movie}/edit', function(Movie $movie) {

    return view('pageEdit', [
        'movie' => $movie,
    ]);

})->name('page.edit');

Route::get('/movie', function () {
    return view('pageList', [
        'movies' => Movie::latest()->get(),
    ]);
})->name('page.list');

Route::get('/movie/{movie}', function (Movie $movie) {
    return view('pageDetail', [
        'movie' => $movie,
    ]);
})->name('page.detail');

Route::post('/movie', function (MovieRequest $movieRequest) {
    
    $movie = Movie::create($movieRequest->validated());

    return redirect() -> Route('page.detail', ['movie' => $movie->id]);

})->name('func.post');

Route::put('/movie/{movie}', function (Movie $movie, MovieRequest $movieRequest) {
    
    $movie -> update($movieRequest->validated());

    return redirect() -> Route('page.edit', ['movie' => $movie->id]);

})->name('func.edit');