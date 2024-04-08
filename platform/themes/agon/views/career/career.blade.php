{!! do_shortcode(sprintf('[page-header title="%s" subtitle="%s" bg_color="#FFF3EA"][/page-header]', $career->name, $career->description)) !!}

<section class="section-box mt-50 mb-50">
    <div class="container">
        <div class="content-detail">
            @if(($location = $career->location) && ($salary = $career->salary))
                <div class="row mb-50">
                    <div class="col-lg-2"></div>
                    <div class="col-lg-8">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h5>
                                    <i class="fi-rr-location-alt me-2"></i>{{ __('Location') }}:
                                    <span>{{ $location }}</span>
                                </h5>
                            </div>

                            <div>
                                <h5>
                                    <i class="fi-rr-briefcase me-2"></i>
                                    {{ __('Salary') }}:
                                    <span>{{ $salary }}</span>
                                </h5>
                            </div>
                        </div>
                    </div>
                </div>
            @endif

            {!! Html::tag('div', BaseHelper::clean($career->content), ['class' => 'ck-content'])->toHtml() !!}
        </div>
    </div>
</section>
