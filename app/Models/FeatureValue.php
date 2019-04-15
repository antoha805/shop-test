<?php

namespace App\Models;


class FeatureValue extends TranslatedModel
{
    protected $appends = ['value'];

    protected $fillable = ['code'];

    public function feature()
    {
        return $this->belongsTo(Feature::class);
    }

    public function products()
    {
        return $this->morphedByMany(Product::class, 'target', 'feature_valuable');
    }

    public function productModifications()
    {
        return $this->morphedByMany(ProductModification::class, 'target', 'feature_valuable');
    }

    public function getValueAttribute()
    {
        return $this->translate(__('No value'));
    }
}
