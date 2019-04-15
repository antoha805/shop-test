<?php

use App\Models\Feature;
use App\Models\FeatureValue;
use App\Models\Language;
use App\Models\Product;
use App\Models\ProductModification;
use App\Models\Translation;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    private $languages;
    private $features = [
        'color' => [
            'values' => [
                'white' => [
                    'translations' => [
                        'en' => 'White',
                        'ru' => 'Белый',
                        'ua' => 'Білий'
                    ]
                ],
                'black' => [
                    'translations' => [
                        'en' => 'Black',
                        'ru' => 'Черный',
                        'ua' => 'Чорний'
                    ],
                ]
            ],
            'translations' => [
                'en' => 'Color',
                'ru' => 'Цвет',
                'ua' => 'Колір'
            ]
        ],
        'size' => [
            'values' => [
                'small' => [
                    'translations' => [
                        'en' => 'White',
                        'ru' => 'Белый',
                        'ua' => 'Білий'
                    ]
                ],
                'medium' => [
                    'translations' => [
                        'en' => 'Medium',
                        'ru' => 'Средний',
                        'ua' => 'Середній'
                    ]
                ],
                'big' => [
                    'translations' => [
                        'en' => 'Big',
                        'ru' => 'Большой',
                        'ua' => 'Великий'
                    ]
                ],
            ],
            'translations' => [
                'en' => 'Size',
                'ru' => 'Размер',
                'ua' => 'Розмір'
            ]
        ],
    ];
    private $products = [
        [
            'price' => 26.40,
            'translations' => [
                'en' => 'Wallet',
                'ru' => 'Кошелек',
                'ua' => 'Гаманець'
            ],
            'features' => ['size' => 'medium'],
            'modifications' => [
                ['color' => 'black'],
                ['color' => 'white', 'size' => 'big']
            ]
        ],
        [
            'price' => 120.67,
            'translations' => [
                'en' => 'Suit',
                'ru' => 'Костюм',
                'ua' => 'Костюм'
            ],
            'modifications' => [
                ['color' => 'black', 'size' => 'small'],
                ['color' => 'white', 'size' => 'big']
            ]
        ],
    ];

    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(LanguagesTableSeeder::class);

        collect($this->features)->each(function ($item, $key1) {
            $feature = Feature::create(['code' => $key1]);
            $this->addTranslations($feature, $item['translations']);
            collect($item['values'])->each(function ($item, $key2) use ($feature, $key1){
                $featureValue = FeatureValue::create(['feature_id' => $feature->id, 'code' => $key2]);
                $this->addTranslations($featureValue, $item['translations']);
                $this->features[$key1][$key2]['model'] = $featureValue;
            });
        });

        collect($this->products)->each(function ($item, $key) {
            $product = Product::create([
                'code' => Str::random(10),
                'price' => $item['price']
            ]);
            $this->addTranslations($product, $item['translations']);

            if (isset($item['features'])){

                $product->featureValues()->attach($this->getProductValueIds($item['features']));
            }

            if (isset($item['modifications'])){

                collect($item['modifications'])->each(function ($item, $key) use ($product){

                    $productModification = ProductModification::create([
                        'product_id' => $product->id,
                        'code' => Str::random(10),
                    ]);

                    $productModification->featureValues()->attach($this->getProductValueIds($item));
                });
            }
        });
    }

    public function addTranslations(Model $target, array $translations){

        $languages = $this->languages ?? Language::all();

        $models = [];

        collect($translations)->each(function ($item, $key) use (&$models, $languages){

            $models[] = new Translation([
                    'language_id' => $languages->firstWhere('code', $key)->id,
                    'value' => $item
                ]);
        });

        $target->translations()->saveMany($models);
    }

    public function getProductValueIds(array $codes){

        $ids = [];

        foreach (array_keys($codes) as $featureCode){

            if (is_array($codes[$featureCode])){

                foreach ($codes[$featureCode] as $featureValueCode){

                    $ids[] = $this->features[$featureCode][$featureValueCode]['model']->id;
                }
            }

            else {

                $ids[] = $this->features[$featureCode][$codes[$featureCode]]['model']->id;
            }
        }

        return $ids;
    }
}
