<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Admin\ExternalUrl;
use App\Models\Admin\Faq;
use App\Models\Admin\FaqSection;
use App\Models\Admin\FixedPageSetting;
use App\Models\Admin\Footer;
use App\Models\Admin\FooterCategory;
use App\Models\Admin\FooterImage;
use App\Models\Admin\HeaderImage;
use App\Models\Admin\Menu;
use App\Models\Admin\PageBuilder;
use App\Models\Admin\SiteInfo;
use App\Models\Admin\Social;
use App\Models\Admin\Team;
use App\Models\Admin\TeamCategory;
use App\Models\Admin\TeamSection;
use Illuminate\Support\Facades\DB;

class TeamController extends Controller
{
    /**
     * Display the specified resource.
     *
     * @param  string  $category_name
     * @return \Illuminate\Http\Response
     */
    public function category_index ($category_name = null) {
        // Default variable
        $header_image_style1 = null;
        $header_image_style2 = null;
        $header_image_style3 = null;
        $footer_image_style1 = null;
        $footer_image_style2 = null;
        $footer_image_style3 = null;
        $team_limit = 6;

        // Get site language
        $language = getSiteLanguage();

        // Get common model
        list($preloader, $favicon, $seo, $google_analytic, $tawk_to, $bottom_button_widget, $side_button_widget, $color_option, $breadcrumb_image, $font, $draft_view) = getCommonModel($language);

        $page_builder = PageBuilder::where('page_name', 'team-category-index')->first();

        // URL detection when language changes
        $team_index = PageBuilder::where('page_name', 'team-index')->first();

        // Retrieve models
        $fixed_page_setting = FixedPageSetting::first();
        if (isset($fixed_page_setting)) {
            if ($fixed_page_setting->header_style == 'style1') {
                $header_image_style1 = HeaderImage::where('style', 'style1')->first();
            } elseif ($fixed_page_setting->header_style == 'style2') {
                $header_image_style2 = HeaderImage::where('style', 'style2')->first();
            } else {
                $header_image_style3 = HeaderImage::where('style', 'style3')->first();
            }
        } else {
            $header_image_style1 = HeaderImage::where('style', 'style1')->first();
        }
        // Retrieve models
        $external_url = ExternalUrl::where('language_id', $language->id)->first();
        $menus = Menu::with('submenus')
            ->where('language_id', $language->id)
            ->where('status', 'published')
            ->orderBy('order', 'asc')
            ->get();

        $team_section_paginate_style = TeamSection::where('language_id', $language->id)->first();
        if (isset($team_section_paginate_style)) {
            $team_limit = $team_section_paginate_style->paginate_item;
        }
        $teams_paginate_style = Team::join("team_categories",'team_categories.id', '=', 'teams.category_id')
            ->where('team_categories.language_id', $language->id)
            ->where('team_categories.team_category_slug', '=', $category_name)
            ->where('teams.style', 'style1')
            ->where('team_categories.status', 1)
            ->where('teams.status', 'published')
            ->orderBy('teams.order', 'asc')
            ->select('teams.*', 'teams.id')
            ->paginate($team_limit);
        $team_count_categories = Team::select(DB::raw('count(*) as category_count, category_id'))
            ->where('language_id', $language->id)
            ->where('teams.status', 'published')
            ->groupBy('category_id')
            ->get();

        $category = TeamCategory::where('language_id', $language->id)
            ->where('team_category_slug', '=', $category_name)->first();

        if (count($teams_paginate_style) < 1) {
            abort(404);
        }

        $socials = Social::where('status', 1)->get();
        if (isset($fixed_page_setting)) {
            if ($fixed_page_setting->header_style == 'style1') {
                $footer_image_style1 = FooterImage::where('style', 'style1')->first();
            } elseif ($fixed_page_setting->header_style == 'style2') {
                $footer_image_style2 = FooterImage::where('style', 'style2')->first();
            } elseif ($fixed_page_setting->header_style == 'style3') {
                $footer_image_style3 = FooterImage::where('style', 'style3')->first();
            }
        } else {
            $footer_image_style1 = FooterImage::where('style', 'style1')->first();
        }
        $site_info_section_style1 = SiteInfo::where('language_id', $language->id)->first();
        $footers = Footer::join("footer_categories", 'footer_categories.id', '=', 'footers.category_id')
            ->where('footer_categories.language_id', $language->id)
            ->where('footer_categories.status', 1)
            ->where('footers.status', 'published')
            ->orderBy('footers.id', 'asc')
            ->get();
        $footer_categories = FooterCategory::where('language_id', $language->id)
            ->where('footer_categories.status', 1)
            ->orderBy('order', 'asc')
            ->get();


        return view('frontend.team.category-index', compact('preloader', 'favicon', 'seo', 'google_analytic',
            'tawk_to', 'bottom_button_widget', 'side_button_widget', 'color_option', 'breadcrumb_image', 'font','draft_view',
            'header_image_style1', 'header_image_style2', 'header_image_style3', 'socials', 'external_url',
            'menus', 'team_count_categories', 'team_section_paginate_style', 'teams_paginate_style', 'category',
            'footer_image_style1', 'footer_image_style2', 'footer_image_style3', 'site_info_section_style1',
            'footers', 'footer_categories', 'team_index', 'page_builder'));
    }

}
