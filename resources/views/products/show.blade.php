@extends('layouts.app')

@section('content')

    <div class="container">

        <h1>{{ __('Name') }}: {{ $product->name }}<br></h1>
        <h2>{{ __('Code') }}: {{ $product->code }}<br></h2>
        <h2>{{ __('Price') }}: ${{ $product->price }}<br></h2>

        <h2>{{ __('Features') }}:</h2>

        <features :features="{{
                    $product->featureValues->map(function ($item, $key) {
                        return [
                            'name' => $item->feature->name,
                            'value' => $item->value
                        ];
                    })->toJson()
                }}"></features>

        @if($product->modifications->count())

            <h2>{{ __('Modifications') }}:</h2>

            <select v-model="productModificationId" class="form-control">

                @foreach($product->modifications as $modification)

                    <option value="{{$modification->id}}">{{$modification->code}}</option>

                @endforeach

            </select>

        @endif

    </div>

@endsection



