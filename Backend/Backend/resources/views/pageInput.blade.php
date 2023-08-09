@extends('layout.app')

@section('title', 'Input Data')

@section('content')
    <div>
        <form method="POST" action="{{ route('func.post') }}">
            @csrf
            <div>
                <label for="title">Title</label>
                <input type="text" name="title" id="title" value="{{ old('title') }}">
            </div>
            <br>
            <div>
                <label for="genre">Genre</label>
                <input type="text" name="genre" id="genre" value="{{ old('genre') }}">
            </div>
            <br>
            <div>
                <label for="release">Release</label>
                <input type="date" name="release" id="release" value="{{ old('release') }}">
            </div>
            <br>
            <div>
                <label for="rate">Rate</label>
                <input type="decimal" name="rate" id="rate" value="{{ old('rate') }}">
            </div>
            <br>
            <div>
                <label for="sinopsis">Sinopsis</label>
                <textarea name="sinopsis" id="sinopsis" cols="30" rows="10">{{ old('sinopsis') }}</textarea>
            </div>
            <br>
            <div>
                <label for="poster">Poster</label>
                <textarea name="poster" id="poster" cols="30" rows="10">{{ old('poster') }}</textarea>
            </div>
            <br>
            <div>
                <button type="submit">
                    Add Movie
                </button>
            </div>
        </form>
    </div>
@endsection
    