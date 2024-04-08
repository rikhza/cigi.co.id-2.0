<?php

namespace Database\Seeders;

use Botble\Base\Models\BaseModel;
use Botble\Base\Supports\BaseSeeder;
use Botble\Page\Models\Page;
use Botble\Setting\Models\Setting;
use Botble\Theme\Facades\Theme;
use Carbon\Carbon;

class ThemeOptionSeeder extends BaseSeeder
{
    public function run(): void
    {
        $this->uploadFiles('general');

        $theme = Theme::getThemeName();
        Setting::query()->where('key', 'LIKE', 'theme-' . $theme . '-%')->delete();

        $settings = [
            [
                'key' => 'theme',
                'value' => $theme,
            ],
            [
                'key' => 'theme-' . $theme . '-site_title',
                'value' => 'Agon - Multipurpose Agency Laravel Script',
            ],
            [
                'key' => 'theme-' . $theme . '-seo_description',
                'value' => 'Agon is a Multipurpose Agency Laravel Script. It is a powerful, clean, modern, and fully responsive template. It is designed for agency, business, corporate, creative, freelancer, portfolio, photography, personal, resume, and any kind of creative fields.',
            ],
            [
                'key' => 'theme-' . $theme . '-copyright',
                'value' => sprintf('©%s Archi Elite JSC. All Rights Reserved.', Carbon::now()->format('Y')),
            ],
            [
                'key' => 'theme-' . $theme . '-homepage_id',
                'value' => Page::query()->value('id'),
            ],
            [
                'key' => 'theme-' . $theme . '-blog_page_id',
                'value' => Page::query()->skip(1)->value('id'),
            ],
            [
                'key' => 'theme-' . $theme . '-favicon',
                'value' => 'general/favicon.png',
            ],
            [
                'key' => 'theme-' . $theme . '-logo',
                'value' => 'general/logo.png',
            ],
            [
                'key' => 'theme-' . $theme . '-seo_og_image',
                'value' => 'general/open-graph-image.png',
            ],
            [
                'key' => 'theme-' . $theme . '-action_button_text',
                'value' => 'Contact Us',
            ],
            [
                'key' => 'theme-' . $theme . '-action_button_url',
                'value' => '/contact',
            ],
            [
                'key' => 'theme-' . $theme . '-cookie_consent_message',
                'value' => 'Your experience on this site will be improved by allowing cookies ',
            ],
            [
                'key' => 'theme-' . $theme . '-cookie_consent_learn_more_url',
                'value' => '/cookie-policy',
            ],
            [
                'key' => 'theme-' . $theme . '-cookie_consent_learn_more_text',
                'value' => 'Cookie Policy',
            ],
            [
                'key' => 'theme-' . $theme . '-cookie_consent_learn_abc_more_text',
                'value' => 'ABC',
            ],
            [
                'key' => 'theme-' . $theme . '-background_post_single',
                'value' => 'general/bg-post.png',
            ],
            [
                'key' => 'theme-' . $theme . '-address',
                'value' => '66 avenue des Champs, 75008, Paris, France',
            ],
            [
                'key' => 'theme-' . $theme . '-hotline',
                'value' => '(+01) - 456 789',
            ],
            [
                'key' => 'theme-' . $theme . '-email',
                'value' => 'contact@agon.com',
            ],
            [
                'key' => 'theme-' . $theme . '-login_background',
                'value' => 'general/login.png',
            ],
            [
                'key' => 'theme-' . $theme . '-primary_color',
                'value' => '#006D77',
            ],
            [
                'key' => 'theme-' . $theme . '-secondary_color',
                'value' => '#8D99AE',
            ],
            [
                'key' => 'theme-' . $theme . '-danger_color',
                'value' => '#EF476F',
            ],
            [
                'key' => 'theme-' . $theme . '-primary_font',
                'value' => 'Chivo',
            ],
            [
                'key' => 'theme-' . $theme . '-secondary_font',
                'value' => 'Noto Sans',
            ],
        ];

        foreach ($settings as &$item) {
            if (BaseModel::determineIfUsingUuidsForId()) {
                $item['id'] = BaseModel::newUniqueId();
            }
        }

        Setting::query()->insertOrIgnore($settings);

        $socialLinks = [
            [
                [
                    'key' => 'social-name',
                    'value' => 'Facebook',
                ],
                [
                    'key' => 'social-icon',
                    'value' => 'general/facebook.png',
                ],
                [
                    'key' => 'social-url',
                    'value' => 'https://www.facebook.com/',
                ],
            ],
            [
                [
                    'key' => 'social-name',
                    'value' => 'Twitter',
                ],
                [
                    'key' => 'social-icon',
                    'value' => 'general/twitter.png',
                ],
                [
                    'key' => 'social-url',
                    'value' => 'https://www.twitter.com/',
                ],
            ],
            [
                [
                    'key' => 'social-name',
                    'value' => 'Instagram',
                ],
                [
                    'key' => 'social-icon',
                    'value' => 'general/instagram.png',
                ],
                [
                    'key' => 'social-url',
                    'value' => 'https://www.instagram.com/',
                ],
            ],
            [
                [
                    'key' => 'social-name',
                    'value' => 'LinkedIn',
                ],
                [
                    'key' => 'social-icon',
                    'value' => 'general/linkedin.png',
                ],
                [
                    'key' => 'social-url',
                    'value' => 'https://www.linkedin.com/',
                ],
            ],
        ];

        $data = [
            'key' => 'theme-' . $theme . '-social_links',
            'value' => json_encode($socialLinks),
        ];

        if (BaseModel::determineIfUsingUuidsForId()) {
            $data['id'] = BaseModel::newUniqueId();
        }

        Setting::query()->insertOrIgnore($data);
    }
}
