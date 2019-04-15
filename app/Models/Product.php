<?php

namespace App\Models;

class Product extends TranslatedModel
{
    protected $appends = ['name'];

    protected $fillable = ['parent_id', 'code', 'price'];

    public function modifications()
    {
        return $this->hasMany(Product::class, 'parent_id');
    }

    public function product()
    {
        return $this->belongsTo(Product::class, 'parent_id');
    }

    public function featureValues()
    {
        return $this->belongsToMany(FeatureValue::class);
    }

    public function getNameAttribute()
    {
        $default = __('No name');

        $name = $this->translate($default);

        if (!$this->parent_id || $name !== $default){
            return $name;
        }

        return $this->product->translate($default);
    }
}
