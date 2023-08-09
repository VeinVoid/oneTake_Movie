@extends('layout.app')

@section('navbar')
    <div>
        <a href="{{ route('page.input') }}">Input Data</a>
    </div>
@endsection

@section('title', 'Movie List')

@section('content')
    <div>
        @forelse ($movies as $movie)
            <div>
                <a href={{ route('page.detail', ['movie' => $movie->id]) }}>
                    {{ $movie->title }}
                </a>
            </div>
        @empty
           <div>No Movie</div>     
        @endforelse
    </div>
@endsection