<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Lang;

abstract class TranslatedModel extends Model
{

    public function translations()
    {
        return $this->morphMany(Translation::class, 'target');
    }

    protected function translate(string $default = null){

        return $this->translations->first(function ($trans, $key) {
                return $trans->language->code == Lang::getLocale();
            })->value ?? $default ?? __('No translation');
    }
}
