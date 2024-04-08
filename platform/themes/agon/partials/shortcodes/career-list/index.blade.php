<section class="section-box mt-100">
    <div class="container">
        <div class="row">
            <div class="col-lg-1 col-sm-1 col-12"></div>
            <div class="col-lg-10 col-sm-10 col-12 text-center">
                @if($title = $shortcode->title)
                    <h2 class="text-heading-1 color-gray-900 mb-10">
                        {!! BaseHelper::clean($title) !!}
                    </h2>
                @endif
                @if($description = $shortcode->description)
                    <p class="text-body-lead-large color-gray-600 mt-20">
                        {!! BaseHelper::clean($description) !!}
                    </p>
                @endif
            </div>
            <div class="col-lg-1 col-sm-1 col-12"></div>
        </div>
    </div>
    <div class="container mt-40">
        <div class="row">
            @foreach($careers as $career)
                <div class="col-lg-4 col-md-12 col-sm-12">
                    <div class="list-icons mt-40 hover-up">
                        <div class="item-icon">
                            <span class="icon-left">
                                <img src="{{ RvMedia::getImageUrl($career->getMetadata('image', true)) }}" alt="{{ $career->name }}">
                            </span>
                            <h4 class="text-heading-4 text-truncate">
                                <a href="{{ $career->url }}" title="{{ $career->name }}">
                                    {{ $career->name }}
                                </a>
                            </h4>
                            <p class="text-body-text color-gray-600 mt-15">
                                {!! Str::words(BaseHelper::clean($career->description), 10) !!}
                            </p>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</section>
