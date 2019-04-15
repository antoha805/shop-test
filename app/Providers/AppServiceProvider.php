<?php

namespace App\Providers;

use App\Models\Feature;
use App\Models\FeatureValue;
use App\Models\Product;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        Schema::defaultStringLength(191);
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Relation::morphMap([
            'feature' => Feature::class,
            'feature_value' => FeatureValue::class,
            'product' => Product::class
        ]);
    }
}
