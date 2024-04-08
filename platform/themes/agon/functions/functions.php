<?php

use Botble\Base\Facades\Form;
use Botble\Base\Facades\Html;
use Botble\Base\Facades\MetaBox;
use Botble\Base\Forms\FormAbstract;
use Botble\Base\Models\MetaBox as MetaBoxModel;
use Botble\Blog\Models\Post;
use Botble\Career\Models\Career;
use Botble\Ecommerce\Models\Customer;
use Botble\LanguageAdvanced\Supports\LanguageAdvancedManager;
use Botble\Media\Facades\RvMedia;
use Botble\Menu\Facades\Menu;
use Botble\Menu\Models\Menu as MenuModel;
use Botble\Page\Models\Page;
use Botble\SocialLogin\Facades\SocialService;
use Botble\Testimonial\Models\Testimonial;
use Botble\Theme\Facades\Theme;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Route;

register_page_template([
    'default' => __('Default'),
    'homepage' => __('Homepage'),
    'page-detail' => __('Page detail'),
]);

register_sidebar([
    'id' => 'pre_footer_sidebar',
    'name' => __('Pre footer sidebar'),
    'description' => __('Widgets at the bottom of the page.'),
]);

register_sidebar([
    'id' => 'footer_sidebar',
    'name' => __('Footer sidebar'),
    'description' => __('Widgets in footer of page'),
]);

if (is_plugin_active('ecommerce')) {
    register_sidebar([
        'id' => 'product_list_sidebar',
        'name' => __('Product list sidebar'),
        'description' => __('Widgets in product list page'),
    ]);

    register_sidebar([
        'id' => 'product_list_bottom_sidebar',
        'name' => __('Product list bottom sidebar'),
        'description' => __('Widgets in product list bottom page'),
    ]);
}

Menu::addMenuLocation('header-menu', __('Header Navigation'));
Menu::addMenuLocation('footer-bottom-menu', __('Footer Bottom Menu'));

RvMedia::setUploadPathAndURLToPublic();
RvMedia::addSize('large', 620, 380)
    ->addSize('medium', 398, 255)
    ->addSize('small', 300, 280);

if (is_plugin_active('testimonial')) {
    app()->booted(function () {
        Testimonial::resolveRelationUsing('title', function ($model) {
            return $model->morphOne(MetaBoxModel::class, 'reference')->where('meta_key', 'title');
        });
    });

    add_action(BASE_ACTION_META_BOXES, function ($context, $object) {
        if ($object::class === Testimonial::class && $context == 'advanced') {
            MetaBox::addMetaBox('additional_testimonial_fields', __('Addition Information'), function () {
                $title = null;
                $args = func_get_args();
                if (! empty($args[0])) {
                    $title = MetaBox::getMetaData($args[0], 'title', true);
                }

                return Html::tag(
                    'div',
                    Html::tag('label', __('Title'), ['class' => 'form-label']) .
                    Form::text('title', $title, ['class' => 'form-control']),
                    ['class' => 'mb-3']
                );
            }, $object::class, $context);
        }
    }, 75, 2);

    add_action([BASE_ACTION_AFTER_CREATE_CONTENT, BASE_ACTION_AFTER_UPDATE_CONTENT], function ($type, $request, $object) {
        if ($object::class === Testimonial::class) {
            if ($request->has('title')) {
                MetaBox::saveMetaBoxData($object, 'title', $request->input('title'));
            }
        }
    }, 75, 3);

    if (is_plugin_active('language-advanced')) {
        LanguageAdvancedManager::addTranslatableMetaBox('additional_testimonial_fields');

        LanguageAdvancedManager::registerModule(Testimonial::class, [
            'name',
            'title',
            'content',
            'company',
        ]);
    }
}

add_action(BASE_ACTION_META_BOXES, function ($context, $object) {
    if ($object::class === Page::class && $context == 'side') {
        MetaBox::addMetaBox('additional_page_fields', __('Addition Information'), function () {
            $headerCSSClass = null;
            $args = func_get_args();
            if (! empty($args[0])) {
                $headerCSSClass = MetaBox::getMetaData($args[0], 'header_css_class', true);
            }

            return Html::tag(
                'div',
                Html::tag('label', __('Header style'), ['class' => 'form-label']) .
                Form::customSelect('header_css_class', [
                    '' => __('Default'),
                    'header-style-2' => __('Header style 2'),
                    'header-style-3' => __('Header style 3'),
                    'header-style-4' => __('Header style 4'),
                    'header-style-5' => __('Header style 5'),
                ], $headerCSSClass),
                ['class' => 'mb-3']
            );
        }, $object::class, $context);
    }
}, 75, 2);

add_action([BASE_ACTION_AFTER_CREATE_CONTENT, BASE_ACTION_AFTER_UPDATE_CONTENT], function ($type, $request, $object) {
    if ($object::class === Page::class) {
        if ($request->has('header_css_class')) {
            MetaBox::saveMetaBoxData($object, 'header_css_class', $request->input('header_css_class'));
        }
    }

    if ($object::class === Post::class) {
        if ($request->has('header_image')) {
            MetaBox::saveMetaBoxData($object, 'header_image', $request->input('header_image'));
        }
    }

    if ($object::class === Post::class) {
        if ($request->has('header_image')) {
            MetaBox::saveMetaBoxData($object, 'header_image', $request->input('header_image'));
        }
    }

    if ($object::class === Career::class) {
        if ($request->has('image')) {
            MetaBox::saveMetaBoxData($object, 'image', $request->input('image'));
        }
    }
}, 75, 3);

add_filter(BASE_FILTER_BEFORE_GET_FRONT_PAGE_ITEM, function ($data, $model) {
    if (get_class($model) == MenuModel::class) {
        $data->with([
            'metadata',
            'menuNodes.child.metadata',
        ]);
    }

    return $data;
}, 3, 2);

if (is_plugin_active('social-login')) {
    app()->booted(function () {
        if (defined('SOCIAL_LOGIN_MODULE_SCREEN_NAME') && Route::has('customer.login')) {
            SocialService::registerModule([
                'guard' => 'customer',
                'model' => Customer::class,
                'login_url' => route('customer.login'),
                'redirect_url' => route('public.index'),
                'view' => Theme::getThemeNamespace('partials.ecommerce.social-login-options'),
                'use_css' => false,
            ]);
        }
    });
}

add_filter(BASE_FILTER_BEFORE_RENDER_FORM, function (FormAbstract $form, ?Model $data) {
    if (get_class($data) === Post::class) {
        $form
            ->addAfter('image', 'header_image', 'mediaImage', [
                'label' => __('Header image'),
                'label_attr' => ['class' => 'form-label'],
                'value' => MetaBox::getMetaData($data, 'header_image', true),
            ]);
    }

    if ($data::class === Career::class) {
        $form
            ->addAfter('status', 'image', 'mediaImage', [
                'label' => __('Image'),
                'label_attr' => ['class' => 'form-label'],
                'value' => MetaBox::getMetaData($data, 'image', true),
            ]);
    }

    return $form;
}, 120, 3);

if (is_plugin_active('ecommerce')) {
    add_filter('ecommerce_product_eager_loading_relations', function (array $with) {
        return array_merge($with, ['categories']);
    }, 120);
}
