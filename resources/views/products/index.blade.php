@extends('layouts.app')

@section('content')

    <div class="container">

        <h1>{{ __('Products') }}</h1>

        <ul class="list-group">
            @foreach($products as $product)

                <li class="list-group-item"><a href="{{ route('products.show', $product->code) }}">{{ $product->name }}</a></li>

            @endforeach

        </ul>
    </div>

@endsection



