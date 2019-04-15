<?php

namespace App\Models;

class Product extends TranslatedModel
{
    protected $fillable = ['code', 'price'];

    public function modifications()
    {
        return $this->hasMany(ProductModification::class);
    }

    public function featureValues()
    {
        return $this->morphToMany(FeatureValue::class, 'target', 'feature_valuable');
    }

    public function getNameAttribute()
    {
        return $this->translate(__('No name'));
    }
}
