@extends('layouts.app')

@section('content')

    <div class="container">

        <product-main-info :info="{{
                    json_encode($product->only(['name', 'code', 'price']))
                    }}"></product-main-info>

        <h2>{{ __('Features') }}:</h2>

        <product-features :features="{{
                    $product->featureValues->map(function ($item, $key) {
                        return [
                            'name' => $item->feature->name,
                            'value' => $item->value
                        ];
                    })->toJson()
                }}"></product-features>

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



