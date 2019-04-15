<?php

namespace App\Http\Controllers;

use App\Models\ProductModification;
use Illuminate\Http\Request;

class ProductModificationController extends Controller
{

    public function __construct()
    {
    }

    public function show(Request $request, $id)
    {

        $productModification = ProductModification::with(
            'product.featureValues.feature.translations.language',
            'featureValues.feature.translations.language')
            ->where('id', $id)
            ->firstOrFail();

        return $productModification;
    }

}
