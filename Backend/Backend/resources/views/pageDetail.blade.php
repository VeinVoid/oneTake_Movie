@extends('layout.app')

@section('title', $movie->title)

@section('content')
    <div>
        <h4>{{ $movie->genre }}</h4>
        <br>
        <img src="{{ $movie->poster }}" width="134px">
        <br>
        <br>
        <h4>{{ $movie->release }}</h4>
        <br>
        <h4>{{ $movie->rate }}</h4>
        <br>
        <br>
        <p>{{ $movie->sinopsis }}</p>
    </div>
@endsection
