@php
    $style = 'style-1';
    if (in_array($shortcode->style, ['style-2'])) {
        $style = $shortcode->style;
    }

    $container = 'col-xl-12 col-lg-12';
    $col = 'col-xl-3 col-lg-6 col-md-6';
    switch (count($tabs)) {
        case 1:
            $container = 'col-xl-4 col-lg-6';
            $col = 'col-12';
            break;
        case 2:
            $container = 'col-xl-6 col-lg-8';
            $col = 'col-lg-6 col-md-6';
            break;
        case 3:
            $container = 'col-xl-10 col-lg-12';
            $col = 'col-lg-4 col-md-6';
            break;
    }
@endphp
<section class="section-box mt-100 @if ($style == 'style-1') section-green @endif"
   style="
        @if ($bgImage1 = $shortcode->background_image_1)
            --background-image-1: url('{{ RvMedia::getImageUrl($bgImage1) }}');
        @endif

        @if ($bgImage2 = $shortcode->background_image_2)
            --background-image-2: url('{{ RvMedia::getImageUrl($bgImage2) }}');
        @endif

        @if ($bgColor = $shortcode->background_color)
            background-color: {{ $bgColor }};
        @endif
   "
>
    <div class="container mt-70">
        <div class="row justify-content-center">
            <div class="col-xl-8 col-lg-10">
                <h3 class="text-heading-1 text-center mb-10 @if ($style == 'style-1') color-white @endif">{!! BaseHelper::clean($shortcode->title) !!}</h3>
            </div>
        </div>
    </div>
    <div class="container mt-70">
        <div class="text-center mt-10 @if ($style == 'style-2') block-bill-2 @endif">
            <span class="text-lg text-billed">{{ __('Billed Monthly') }}</span>
            <label class="switch ml-20 mr-20">
                <input type="checkbox" name="billed_type" aria-label="{{ __('Toggle bill type') }}">
                <span class="slider round"></span>
            </label>
            <span class="text-lg text-billed">{{ __('Bill Annually') }}</span>
        </div>
        <div class="block-pricing mt-70 @if ($style == 'style-2') block-pricing-2 @endif">
            <div class="row justify-content-center">
                <div class="{{ $container }}">
                    <div class="row">
                        @foreach ($tabs as $tab)
                            <div class="{{ $col }} wow animate__animated animate__fadeIn" data-wow-delay=".{{ $loop->iteration }}s">
                                <div class="box-pricing-item @if ($style == 'style-2') hover-up @endif @if (Arr::get($tab, 'active')) active @endif">
                                    <div class="box-info-price">
                                        <span class="text-heading-3 for-month display-month">{{ Arr::get($tab, 'month_price') }}</span>
                                        <span class="text-heading-3 for-year">{{ Arr::get($tab, 'year_price') }}</span>
                                        <span class="text-month for-month text-body-small color-gray-400 display-month">/{{ __('month') }}</span>
                                        <span class="text-month for-year text-body-small color-gray-400">/{{ __('year') }}</span>
                                    </div>
                                    <div class="line-bd-bottom">
                                        <h4 class="text-heading-5 mb-15">{!! BaseHelper::clean(Arr::get($tab, 'title')) !!}</h4>
                                        <p class="text-body-small color-gray-400">{!! BaseHelper::clean(Arr::get($tab, 'subtitle')) !!}</p>
                                    </div>
                                    <ul class="list-package-feature">
                                        @foreach (Arr::get($tab, 'checked', []) as $item)
                                            <li>
                                                <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M10.9999 0C4.93461 0 0 4.9345 0 10.9999C0 17.0654 4.93461 22 10.9999 22C17.0653 22 21.9999 17.0654 21.9999 10.9999C21.9999 4.9345 17.0654 0 10.9999 0ZM17.3163 9.14196L10.4056 16.0527C10.1118 16.3465 9.72115 16.5082 9.30564 16.5082C8.89013 16.5082 8.49952 16.3465 8.20568 16.0527L4.68358 12.5306C4.38974 12.2367 4.2279 11.8461 4.2279 11.4306C4.2279 11.015 4.38974 10.6244 4.68358 10.3305C4.97731 10.0367 5.36791 9.87485 5.78354 9.87485C6.19905 9.87485 6.58977 10.0367 6.8835 10.3306L9.30552 12.7526L15.1162 6.94193C15.41 6.64808 15.8006 6.48635 16.2161 6.48635C16.6316 6.48635 17.0222 6.64808 17.3161 6.94193C17.9228 7.54867 17.9228 8.53545 17.3163 9.14196Z" fill="currentColor"/>
                                                </svg>
                                                {{ $item }}
                                            </li>
                                        @endforeach
                                        @foreach (Arr::get($tab, 'uncheck', []) as $item)
                                            <li class="uncheck">
                                                <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M11 21.0834C12.9943 21.0834 14.9438 20.492 16.602 19.384C18.2602 18.276 19.5526 16.7012 20.3158 14.8587C21.0789 13.0163 21.2786 10.9888 20.8896 9.03286C20.5005 7.07689 19.5401 5.28021 18.13 3.87003C16.7198 2.45985 14.9231 1.49951 12.9671 1.11044C11.0112 0.721372 8.98373 0.921056 7.14124 1.68424C5.29875 2.44742 3.72395 3.73983 2.61598 5.39802C1.508 7.05622 0.916626 9.00573 0.916626 11C0.91978 13.6733 1.98314 16.2362 3.87345 18.1265C5.76376 20.0168 8.32667 21.0802 11 21.0834V21.0834ZM11 2.75002C12.6317 2.75002 14.2267 3.23388 15.5834 4.1404C16.9401 5.04692 17.9976 6.3354 18.622 7.84289C19.2464 9.35038 19.4098 11.0092 19.0915 12.6095C18.7731 14.2099 17.9874 15.6799 16.8336 16.8337C15.6798 17.9874 14.2098 18.7732 12.6095 19.0915C11.0091 19.4098 9.35032 19.2465 7.84283 18.622C6.33533 17.9976 5.04686 16.9402 4.14034 15.5835C3.23382 14.2268 2.74996 12.6317 2.74996 11C2.75239 8.81273 3.62236 6.71572 5.16901 5.16907C6.71566 3.62242 8.81267 2.75245 11 2.75002Z" fill="currentColor"/>
                                                    <path d="M7.60188 14.3981C7.77379 14.5699 8.0069 14.6665 8.24997 14.6665C8.49304 14.6665 8.72615 14.5699 8.89805 14.3981L11 12.2962L13.1019 14.3981C13.2748 14.5651 13.5063 14.6574 13.7467 14.6554C13.987 14.6533 14.2169 14.5569 14.3869 14.3869C14.5569 14.217 14.6533 13.987 14.6553 13.7467C14.6574 13.5063 14.565 13.2748 14.3981 13.1019L12.2961 11L14.3981 8.89809C14.565 8.7252 14.6574 8.49365 14.6553 8.2533C14.6533 8.01296 14.5569 7.78305 14.3869 7.61309C14.2169 7.44313 13.987 7.34673 13.7467 7.34464C13.5063 7.34255 13.2748 7.43495 13.1019 7.60192L11 9.70384L8.89805 7.60192C8.72517 7.43495 8.49362 7.34255 8.25327 7.34464C8.01292 7.34673 7.78301 7.44313 7.61305 7.61309C7.44309 7.78305 7.34669 8.01296 7.3446 8.2533C7.34251 8.49365 7.43491 8.7252 7.60188 8.89809L9.70381 11L7.60188 13.1019C7.43004 13.2738 7.3335 13.5069 7.3335 13.75C7.3335 13.9931 7.43004 14.2262 7.60188 14.3981V14.3981Z" fill="currentColor"/>
                                                </svg>

                                                {{ $item }}
                                            </li>
                                        @endforeach
                                    </ul>
                                    @if (Arr::get($tab, 'link'))
                                        <div>
                                            <a class="btn btn-black-border text-body-lead icon-arrow-right" href="{{ Arr::get($tab, 'link') }}">{{ Arr::get($tab, 'title_link') }}</a>
                                        </div>
                                    @endif
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
