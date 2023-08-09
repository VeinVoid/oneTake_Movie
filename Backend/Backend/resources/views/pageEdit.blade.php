@extends('layout.app')

@section('title', 'Edit Data')

@section('content')
    <div>
        <form method="POST" action="{{ route('func.edit', ['movie' => $movie->id]) }}">
            @csrf
            @method('PUT')
            <div>
                <label for="title">Title</label>
                <input type="text" name="title" id="title" value="{{ $movie->title }}">
            </div>
            <br>
            <div>
                <label for="genre">Genre</label>
                <input type="text" name="genre" id="genre" value="{{ $movie->genre }}">
            </div>
            <br>
            <div>
                <label for="release">Release</label>
                <input type="date" name="release" id="release" value="{{ $movie->release }}">
            </div>
            <br>
            <div>
                <label for="rate">Rate</label>
                <input type="decimal" name="rate" id="rate" value="{{ $movie->rate }}">
            </div>
            <br>
            <div>
                <label for="sinopsis">Sinopsis</label>
                <textarea name="sinopsis" id="sinopsis" cols="30" rows="10">{{ $movie->sinopsis }}</textarea>
            </div>
            <br>
            <div>
                <label for="poster">Poster</label>
                <textarea name="poster" id="poster" cols="30" rows="10">{{ $movie->poster }}</textarea>
            </div>
            <br>
            <div>
                <button type="submit">
                    Edit Movie
                </button>
            </div>
        </form>
    </div>
@endsection
