<?php

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Facades\Html;
use Botble\Career\Models\Career;
use Botble\Ecommerce\Facades\EcommerceHelper;
use Botble\Ecommerce\Facades\ProductCategoryHelper;
use Botble\Ecommerce\Repositories\Interfaces\ProductCategoryInterface;
use Botble\Ecommerce\Repositories\Interfaces\ProductInterface;
use Botble\Faq\Contracts\Faq;
use Botble\Faq\FaqCollection;
use Botble\Faq\FaqItem;
use Botble\Faq\Repositories\Interfaces\FaqCategoryInterface;
use Botble\Faq\Repositories\Interfaces\FaqInterface;
use Botble\Shortcode\Compilers\Shortcode as ShortcodeCompiler;
use Botble\Shortcode\Facades\Shortcode;
use Botble\Testimonial\Repositories\Interfaces\TestimonialInterface;
use Botble\Theme\Facades\Theme;
use Botble\Theme\Supports\ThemeSupport;
use Botble\Theme\Supports\Youtube;
use Illuminate\Database\Eloquent\Collection;

app()->booted(function () {
    ThemeSupport::registerGoogleMapsShortcode();

    Shortcode::register('hero-banner', __('Hero banner'), __('Hero banner'), function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.hero-banner.index', compact('shortcode'));
    });

    Shortcode::setAdminConfig('hero-banner', function (array $attributes) {
        return Theme::partial('shortcodes.hero-banner.admin-config', compact('attributes'));
    });

    Shortcode::register('quotation', __('Quotation'), __('Quotation'), function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.quotation', compact('shortcode'));
    });

    Shortcode::setAdminConfig('quotation', function (array $attributes) {
        return Theme::partial('shortcodes.quotation-admin-config', compact('attributes'));
    });

    Shortcode::register('we-are-trusted', __('We are trusted'), __('We are trusted'), function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.we-are-trusted', compact('shortcode'));
    });

    Shortcode::setAdminConfig('we-are-trusted', function (array $attributes) {
        return Theme::partial('shortcodes.we-are-trusted-admin-config', compact('attributes'));
    });

    Shortcode::register('we-facilitate', __('We facilitate'), __('We facilitate'), function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.we-facilitate.index', compact('shortcode'));
    });

    Shortcode::setAdminConfig('we-facilitate', function (array $attributes) {
        return Theme::partial('shortcodes.we-facilitate.admin-config', compact('attributes'));
    });

    Shortcode::register('we-do-you-get', __('We do - You get'), __('We do - You get'), function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.we-do-you-get.index', compact('shortcode'));
    });

    Shortcode::setAdminConfig('we-do-you-get', function (array $attributes) {
        return Theme::partial('shortcodes.we-do-you-get.admin-config', compact('attributes'));
    });

    Shortcode::register('how-it-works', __('How It Works'), __('How It Works'), function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.how-it-works.index', compact('shortcode'));
    });

    Shortcode::setAdminConfig('how-it-works', function (array $attributes) {
        return Theme::partial('shortcodes.how-it-works.admin-config', compact('attributes'));
    });

    Shortcode::register('companies', __('Companies'), __('Companies'), function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.companies', compact('shortcode'));
    });

    Shortcode::setAdminConfig('companies', function (array $attributes) {
        return Theme::partial('shortcodes.companies-admin-config', compact('attributes'));
    });

    Shortcode::register('quotation', __('Quotation'), __('Quotation'), function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.quotation.index', compact('shortcode'));
    });

    Shortcode::setAdminConfig('quotation', function (array $attributes) {
        return Theme::partial('shortcodes.quotation.admin-config', compact('attributes'));
    });

    Shortcode::register('statistical', __('Statistical'), __('Statistical'), function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.statistical.index', compact('shortcode'));
    });

    Shortcode::setAdminConfig('statistical', function (array $attributes) {
        return Theme::partial('shortcodes.statistical.admin-config', compact('attributes'));
    });

    Shortcode::register('our-team', __('Our team'), __('Our team'), function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.our-team', compact('shortcode'));
    });

    Shortcode::setAdminConfig('our-team', function (array $attributes) {
        return Theme::partial('shortcodes.our-team-admin-config', compact('attributes'));
    });

    Shortcode::register('our-location', __('Our location'), __('Our location'), function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.our-location', compact('shortcode'));
    });

    Shortcode::setAdminConfig('our-location', function (array $attributes) {
        return Theme::partial('shortcodes.our-location-admin-config', compact('attributes'));
    });

    Shortcode::register('page-header', __('Page header'), __('Page header'), function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.page-header', compact('shortcode'));
    });

    Shortcode::setAdminConfig('page-header', function (array $attributes) {
        return Theme::partial('shortcodes.page-header-admin-config', compact('attributes'));
    });

    if (is_plugin_active('testimonial')) {
        Shortcode::register('testimonials', __('Testimonials'), __('Testimonials'), function (ShortcodeCompiler $shortcode) {
            $testimonials = app(TestimonialInterface::class)->advancedGet([
                'condition' => [
                    'status' => BaseStatusEnum::PUBLISHED,
                ],
                'take' => (int) $shortcode->number_of_displays,
            ]);

            return Theme::partial('shortcodes.testimonials.index', compact('shortcode', 'testimonials'));
        });

        Shortcode::setAdminConfig('testimonials', function (array $attributes) {
            return Theme::partial('shortcodes.testimonials.admin-config', compact('attributes'));
        });
    }

    if (is_plugin_active('blog')) {
        Shortcode::register('our-news', __('Our news'), __('Our news'), function (ShortcodeCompiler $shortcode) {
            $numberOfDisplays = (int) $shortcode->number_of_displays ?: 3;
            $category = null;
            $posts = collect([]);
            $with = ['categories:id,name', 'categories.slugable', 'author', 'slugable'];

            if ($shortcode->category_id) {
                $category = get_category_by_id($shortcode->category_id);
                if ($category) {
                    $posts = get_posts_by_category($category->id, 0, $numberOfDisplays);
                }
            }

            if (! $category) {
                $posts = match ($shortcode->type) {
                    'featured' => get_featured_posts($numberOfDisplays, $with),
                    'recent' => get_recent_posts($numberOfDisplays),
                    default => get_latest_posts($numberOfDisplays, $with),
                };
            }

            if ($posts instanceof Collection) {
                $posts->loadMissing($with);
            }

            return Theme::partial('shortcodes.blog.index', compact('shortcode', 'posts', 'category'));
        });

        Shortcode::setAdminConfig('our-news', function (array $attributes) {
            $categories = [0 => __('-- None --')] + collect(get_categories_with_children())->pluck('name', 'id')->toArray();

            return Theme::partial('shortcodes.blog.admin-config', compact('attributes', 'categories'));
        });
    }

    if (is_plugin_active('newsletter')) {
        Shortcode::register('newsletter', __('Newsletter'), __('Newsletter'), function (ShortcodeCompiler $shortcode) {
            return Theme::partial('shortcodes.newsletter', compact('shortcode'));
        });

        Shortcode::setAdminConfig('newsletter', function (array $attributes) {
            return Theme::partial('shortcodes.newsletter-admin-config', compact('attributes'));
        });
    }

    if (is_plugin_active('contact')) {
        add_filter(CONTACT_FORM_TEMPLATE_VIEW, function () {
            return Theme::getThemeNamespace() . '::partials.shortcodes.contact-form';
        }, 120);

        Shortcode::setAdminConfig('contact-form', function (array $attributes) {
            return Theme::partial('shortcodes.contact-form-admin-config', compact('attributes'));
        });
    }

    if (is_plugin_active('faq')) {
        Shortcode::register('faq', __('FAQs'), __('FAQs'), function (ShortcodeCompiler $shortcode) {
            $condition = ['status' => BaseStatusEnum::PUBLISHED];

            if ($shortcode->category_ids) {
                $categoryIds = explode(',', $shortcode->category_ids);

                if ($categoryIds) {
                    $condition[] = ['category_id', 'IN', $categoryIds];
                }
            }

            $faqs = app(FaqInterface::class)->advancedGet([
                'condition' => $condition,
            ]);

            if (setting('enable_faq_schema', 0)) {
                $schemaItems = new FaqCollection();

                foreach ($faqs as $faq) {
                    $schemaItems->push(new FaqItem($faq->question, $faq->answer));
                }

                app(Faq::class)->registerSchema($schemaItems);
            }

            return Theme::partial('shortcodes.faq.index', compact('shortcode', 'faqs'));
        });

        Shortcode::setAdminConfig('faq', function (array $attributes) {
            $categories = app(FaqCategoryInterface::class)->advancedGet([
                'with' => ['faqs'],
                'condition' => ['status' => BaseStatusEnum::PUBLISHED],
            ]);

            return Theme::partial('shortcodes.faq.admin-config', compact('attributes', 'categories'));
        });

        Shortcode::register('faq-ask', __('FAQs Ask'), __('FAQs Ask'), function (ShortcodeCompiler $shortcode) {
            return Theme::partial('shortcodes.faq.ask', compact('shortcode'));
        });

        Shortcode::setAdminConfig('faq-ask', function (array $attributes) {
            return Theme::partial('shortcodes.faq.ask-admin-config', compact('attributes'));
        });
    }

    Shortcode::register('youtube-video', __('Youtube video'), __('Add youtube video'), function (ShortcodeCompiler $shortcode) {
        $url = Youtube::getYoutubeVideoEmbedURL($shortcode->content);

        return Theme::partial('shortcodes.youtube', compact('shortcode', 'url'));
    });

    Shortcode::setAdminConfig('youtube-video', function (array $attributes, $content) {
        return Theme::partial('shortcodes.youtube-admin-config', compact('attributes', 'content'));
    });

    Shortcode::register('apply-now', __('Apply now'), __('Apply now button and share'), function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.apply-now', compact('shortcode'));
    });

    Shortcode::setAdminConfig('apply-now', function (array $attributes) {
        return Theme::partial('shortcodes.apply-now-admin-config', compact('attributes'));
    });

    Shortcode::register('apps-download', __('Apps download'), __('Apps download'), function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.apps-download', compact('shortcode'));
    });

    Shortcode::setAdminConfig('apps-download', function (array $attributes) {
        return Theme::partial('shortcodes.apps-download-admin-config', compact('attributes'));
    });

    if (is_plugin_active('ecommerce')) {
        Shortcode::register('explore-by-categories', __('Explore by categories'), __('Explore by product categories'), function (ShortcodeCompiler $shortcode) {
            $limitLeft = (int) $shortcode->limit_left ?: 5;
            $limitRight = (int) $shortcode->limit_right ?: 5;
            $limit = $limitLeft + $limitRight;
            $categories = ProductCategoryHelper::getAllProductCategories()
                ->loadCount('products')
                ->where('status', BaseStatusEnum::PUBLISHED)
                ->take($limit);

            $categories = match ($shortcode->sort_by) {
                'featured' => $categories->sortByDesc('is_featured'),
                default => $categories->sortByDesc('products_count'),
            };

            return Theme::partial('shortcodes.ecommerce.explore-by-categories', compact('shortcode', 'categories', 'limitLeft', 'limitRight'));
        });

        Shortcode::setAdminConfig('explore-by-categories', function (array $attributes) {
            return Theme::partial('shortcodes.ecommerce.explore-by-categories-admin-config', compact('attributes'));
        });

        Shortcode::register('featured-products', __('Featured products'), __('Featured products'), function (ShortcodeCompiler $shortcode) {
            $products = get_featured_products([
                    'take' => min((int) $shortcode->limit ?: 24, 120),
                ] + EcommerceHelper::withReviewsParams());

            return Theme::partial('shortcodes.ecommerce.featured-products', compact('shortcode', 'products'));
        });

        Shortcode::setAdminConfig('featured-products', function (array $attributes) {
            return Theme::partial('shortcodes.ecommerce.featured-products-admin-config', compact('attributes'));
        });

        Shortcode::register('products-by-category', __('Products by category'), __('Products by category'), function (ShortcodeCompiler $shortcode) {
            $category = app(ProductCategoryInterface::class)->getFirstBy([
                'status' => BaseStatusEnum::PUBLISHED,
                'id' => $shortcode->category_id,
            ]);

            if (! $category) {
                return null;
            }

            $products = app(ProductInterface::class)->getProductsByCategories([
                    'categories' => [
                        'by' => 'id',
                        'value_in' => array_merge([$category->id], $category->activeChildren->pluck('id')->all()),
                    ],
                    'take' => min((int) $shortcode->limit ?: 4, 24),
                ] + EcommerceHelper::withReviewsParams());

            return Theme::partial('shortcodes.ecommerce.products-by-category', compact('shortcode', 'products'));
        });

        Shortcode::setAdminConfig('products-by-category', function (array $attributes) {
            $categories = ProductCategoryHelper::getProductCategoriesWithIndent();
            $categories = $categories->transform(function ($item) {
                $item->name = $item->indent_text . $item->name;

                return $item;
            })->pluck('name', 'id')->toArray();

            return Theme::partial('shortcodes.ecommerce.products-by-category-admin-config', compact('attributes', 'categories'));
        });
    }

    if (is_plugin_active('career')) {
        Shortcode::register('career-list', __('Career List'), __('Career List'), function (ShortcodeCompiler $shortcode) {
            $careerIds = array_filter(explode(',', $shortcode->career_ids));

            if (empty($careerIds)) {
                return null;
            }

            $careers = Career::query()
                ->whereIn('id', $careerIds)
                ->wherePublished()
                ->get();

            return Theme::partial('shortcodes.career-list.index', compact('shortcode', 'careers'));
        });

        Shortcode::setAdminConfig('career-list', function (array $attributes) {
            $careers = Career::query()
                ->wherePublished()
                ->pluck('name', 'id');

            return Html::style('vendor/core/core/base/libraries/tagify/tagify.css') .
                Html::script('vendor/core/core/base/libraries/tagify/tagify.js') .
                Html::script('vendor/core/core/base/js/tags.js') .
                Theme::partial('shortcodes.career-list.admin-config', compact('attributes', 'careers'));
        });
    }
});
