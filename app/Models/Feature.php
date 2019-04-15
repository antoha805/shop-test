<?php

namespace App\Models;


class Feature extends TranslatedModel
{

    protected $appends = ['name'];

    protected $fillable = ['code'];

    public function values()
    {
        return $this->hasMany(FeatureValue::class);
    }

    public function getNameAttribute()
    {
        return $this->translate(__('No name'));
    }
}
