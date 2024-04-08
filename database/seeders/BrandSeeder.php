<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\Brand;
use Botble\Slug\Facades\SlugHelper;
use Botble\Slug\Models\Slug;
use Illuminate\Support\Str;

class BrandSeeder extends BaseSeeder
{
    protected array $trans = [];

    public function run(): void
    {
        $this->uploadFiles('brands');

        $brands = [
            [
                'logo' => 'brands/1.png',
                'name' => 'Apply',
                'description' => '',
            ],
            [
                'logo' => 'brands/2.png',
                'name' => 'Asus',
                'description' => '',
            ],
            [
                'logo' => 'brands/3.png',
                'name' => 'Samsung',
                'description' => '',
            ],
            [
                'logo' => 'brands/4.png',
                'name' => 'Sony',
                'description' => '',
            ],
            [
                'logo' => 'brands/5.png',
                'name' => 'Toshiba',
                'description' => '',
            ],
        ];

        Brand::query()->truncate();

        foreach ($brands as $key => $item) {
            $item['order'] = $key;
            $item['is_featured'] = true;
            $brand = Brand::query()->create($item);

            Slug::query()->create([
                'reference_type' => Brand::class,
                'reference_id' => $brand->id,
                'key' => Str::slug($brand->name),
                'prefix' => SlugHelper::getPrefix(Brand::class),
            ]);
        }
    }
}
