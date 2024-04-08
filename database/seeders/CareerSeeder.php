<?php

namespace Database\Seeders;

use Botble\Base\Facades\MetaBox;
use Botble\Base\Supports\BaseSeeder;
use Botble\Career\Models\Career;
use Botble\Slug\Facades\SlugHelper;
use Botble\Slug\Models\Slug;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;

class CareerSeeder extends BaseSeeder
{
    public function run(): void
    {
        Career::query()->truncate();
        DB::table('careers_translations');
        Slug::query()
            ->where('reference_type', Career::class)
            ->delete();

        $careers = [
            [
                'name' => 'Senior Full Stack Engineer, Creator Success Full Time',
                'description' => 'Constantly changing work patterns and norms, and the need for organizational resiliency',
                'image' => 'general/icon-acquis.png',
            ],
            [
                'name' => 'Data Science Specialist, Analytics Division',
                'description' => 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit laborum — semper quis lectus nulla',
                'image' => 'general/icon-active.png',
            ],
            [
                'name' => 'Product Marketing Manager, Growth Team',
                'description' => 'Crafting compelling marketing strategies to drive user acquisition and retention',
                'image' => 'general/icon-retent.png',
            ],
            [
                'name' => 'UX/UI Designer, User Experience Team',
                'description' => 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                'image' => 'general/icon-acquis.png',
            ],
            [
                'name' => 'Operations Manager, Supply Chain Division',
                'description' => 'Ensuring smooth and efficient supply chain operations for timely product delivery',
                'image' => 'general/icon-retent.png',
            ],
            [
                'name' => 'Financial Analyst, Investment Group',
                'description' => 'Analyzing market trends and investment opportunities for optimal financial outcomes',
                'image' => 'general/icon-acquis.png',
            ],
        ];

        foreach ($careers as $item) {
            $career = Career::query()->create(array_merge(Arr::except($item, 'image'), [
                'location' => "{$this->fake()->city()}, {$this->fake()->country()}",
                'salary' => format_price($this->fake()->numberBetween(500, 10000)),
                'content' => File::get(database_path('/seeders/contents/career-detail.html')),
            ]));

            MetaBox::saveMetaBoxData($career, 'image', $item['image']);

            Slug::query()->create([
                'reference_type' => Career::class,
                'reference_id' => $career->getKey(),
                'key' => Str::slug($career->name),
                'prefix' => SlugHelper::getPrefix(Career::class),
            ]);
        }
    }
}
