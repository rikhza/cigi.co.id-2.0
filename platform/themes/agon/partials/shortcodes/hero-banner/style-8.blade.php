<div class="banner-hero bg-about-3" @if ($bgColor = $shortcode->background_color) style="background-color: {{ $bgColor }}" @endif>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="text-display-2 color-gray-900">{!! BaseHelper::clean($shortcode->title) !!}</h2>
                    <p class="text-heading-4 color-gray-600 mt-40">{!! BaseHelper::clean($shortcode->subtitle) !!}</p>
                </div>
            </div>
        </div>
    </div>

