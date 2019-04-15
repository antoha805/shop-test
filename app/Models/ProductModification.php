<?php

namespace App\Models;


class ProductModification extends TranslatedModel
{
    protected $fillable = ['product_id', 'code'];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function featureValues()
    {
        return $this->morphToMany(FeatureValue::class, 'target', 'feature_valuable');
    }

    public function features()
    {
        return $this->hasManyThrough(Feature::class, FeatureValue::class);
    }

    public function getValueAttribute()
    {
        return $this->translate(__('No value'));
    }
}
