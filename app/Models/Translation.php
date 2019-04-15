<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Translation extends Model
{

    protected $fillable = [
        'language_id',
        'target_type',
        'target_id',
        'value'
    ];

    public function language()
    {
        return $this->belongsTo(Language::class);
    }

    public function target()
    {
        return $this->morphTo();
    }
}
