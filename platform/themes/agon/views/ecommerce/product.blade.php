{!! Theme::partial('breadcrumbs') !!}

<div class="section-box mt-70"></div>
<section class="section-box">
    <div class="container">
        <div class="row product-details">
            <div class="col-lg-6">
                {!! Theme::partial('ecommerce.product-gallery', compact('product', 'productImages')) !!}
            </div>
            <div class="col-lg-6">
                {!! Theme::partial('ecommerce.product-info', compact('product', 'productVariation', 'selectedAttrs')) !!}
            </div>
        </div>
        <div class="product-description">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <ul class="nav mt-50" role="tablist">
                            <li>
                                <a class="btn btn-default btn-tab active" href="#tab-1" data-bs-toggle="tab" role="tab"
                                    aria-controls="tab-1" aria-selected="true">{{ __('Description') }}</a>
                            </li>
                            @if (is_plugin_active('faq') && count($product->faq_items) > 0)
                                <li>
                                    <a class="btn btn-default btn-tab" href="#tab-2" data-bs-toggle="tab" role="tab"
                                        aria-controls="tab-2" aria-selected="false">{{ __('Questions & Answers') }}</a>
                                </li>
                            @endif
                            @if (is_plugin_active('marketplace') && $product->store_id)
                                <li>
                                    <a class="btn btn-default btn-tab" href="#tab-3" data-bs-toggle="tab" role="tab"
                                        aria-controls="tab-3" aria-selected="false">{{ __('Vendor') }}</a>
                                </li>
                            @endif
                            @if (EcommerceHelper::isReviewEnabled())
                                <li>
                                    <a class="btn btn-default btn-tab" id="product-reviews-tab" href="#tab-4" data-bs-toggle="tab" role="tab"
                                        aria-controls="tab-4" aria-selected="true"><span class="d-inline-block">{{ __('Reviews') }}</span> <span class="d-inline-block">({{ $product->reviews_count }})</span></a>
                                </li>
                            @endif
                        </ul>
                        <div class="tab-content mt-50">
                            <div class="tab-pane fade active show" id="tab-1" role="tabpanel" aria-labelledby="tab-1">
                                <div class="ck-content">
                                    {!! BaseHelper::clean($product->content) !!}
                                </div>

                                {!! apply_filters(BASE_FILTER_PUBLIC_COMMENT_AREA, null, $product) !!}
                            </div>
                            @if (is_plugin_active('faq') && count($product->faq_items) > 0)
                                <div class="tab-pane fade" id="tab-2" role="tabpanel" aria-labelledby="tab-2">
                                    {!! Theme::partial('ecommerce.faq-items', compact('product')) !!}
                                </div>
                            @endif
                            @if (is_plugin_active('marketplace') && $product->store_id)
                                <div class="tab-pane fade" id="tab-3" role="tabpanel" aria-labelledby="tab-3">
                                    @include(Theme::getThemeNamespace('views.marketplace.includes.info-box'), ['store' => $product->store])
                                </div>
                            @endif

                            @if (EcommerceHelper::isReviewEnabled())
                                <div class="tab-pane fade" id="tab-4" role="tabpanel" aria-labelledby="tab-4">
                                    <div class="comments-area">
                                        @include('plugins/ecommerce::themes.includes.reviews')
                                    </div>
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

@if (($products = get_related_products($product)) && $products->count())
    <section class="section-box mt-90">
        <div class="container">
            <h2 class="text-heading-4 color-gray-900">{{ __('You may also like') }}</h2>
            <p class="text-body color-gray-600 mt-10">{{ __('Take it to your cart') }}</p>
        </div>
        <div class="container mt-70">
            <div class="row">
                @foreach ($products as $item)
                    <div class="col-xl-3 col-lg-4 col-md-12">
                        {!! Theme::partial('ecommerce.product-item', ['product' => $item]) !!}
                    </div>
                @endforeach
            </div>
        </div>
    </section>
@endif
