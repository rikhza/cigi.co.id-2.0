<section class="section-box">
    <div class="banner-hero @if (!empty($withBreadcrumbs)) banner-breadcrumbs @else bg-gray-100 @endif">
        <div class="container text-center">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="text-display-3 color-gray-900 mb-20">{{ $title ?? SeoHelper::getTitle() }}</h1>
                    <p class="text-heading-6 color-gray-600 mb-20">{{ $description ?? SeoHelper::getDescription() }}</p>
                    @if (!empty($withBreadcrumbs))
                        <div class="breadcrumbs">
                            <ul class="text-body-text">
                                @foreach ($crumbs = Theme::breadcrumb()->getCrumbs() as $i => $crumb)
                                    @if (!$loop->last)
                                        <li class="@if ($loop->first) home @endif">
                                            <a href="{{ $crumb['url'] }}" class="color-gray-900">
                                                {!! BaseHelper::clean($crumb['label']) !!}
                                            </a>
                                        </li>
                                    @else
                                        <li aria-current="page">
                                            <span class="color-gray-500">{!! BaseHelper::clean($crumb['label']) !!}</span>
                                        </li>
                                    @endif
                                @endforeach
                            </ul>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
</section>
