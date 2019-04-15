<?php

use App\Models\Language;
use Illuminate\Database\Seeder;

class LanguagesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        collect([
            ['code' => 'en', 'name' => 'English'],
            ['code' => 'ru', 'name' => 'Русский'],
            ['code' => 'ua', 'name' => 'Українська']
        ])->each(function ($item, $key){
            Language::create($item);
        });
    }
}
