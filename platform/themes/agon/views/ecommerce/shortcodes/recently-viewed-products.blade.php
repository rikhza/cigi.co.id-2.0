@if ($products->isNotEmpty())
    <div class="section-box">
        @if ($shortcode->title)
            <div class="container mt-50">
                <h3 class="text-heading-2 color-gray-900">{!! BaseHelper::clean($shortcode->title) !!}</h3>
            </div>
        @endif

        <div class="container mt-30 mb-20">
            <div class="row">
                @foreach ($products as $product)
                    <div class="col-xl-3 col-lg-4 col-md-12">
                        {!! Theme::partial('ecommerce.product-item', ['product' => $product]) !!}
                    </div>
                @endforeach
            </div>
        </div>
    </div>
@endif
