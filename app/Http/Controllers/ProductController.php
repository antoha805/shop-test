<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{

    public function __construct()
    {
    }


    public function index(Request $request)
    {

        return view('products.index', [
            'products' => Product::with('translations.language')->get()
        ]);
    }

    public function show(Request $request, $code)
    {

        $product = Product::with(
            'translations.language',
            'featureValues.feature.translations.language',
            'modifications'
            //'modifications.featureValues.feature.translations.language'
            )
            ->where('code', $code)
            ->firstOrFail();

        return view('products.show', compact('product'));
    }

}
