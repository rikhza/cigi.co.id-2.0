<section class="section-box">
    <div class="bg-2-opacity-80">
        <div class="box-login">
            <div class="row">
                <div class="col-xxl-7 col-xl-6 col-lg-6 col-md-12 login-left pl-0 d-none d-lg-flex"
                     @if ($image = (theme_option('login_background')))
                         style="background: url({{ RvMedia::getImageUrl($image) }}) no-repeat 0 0; background-size: cover;"
                    @endif></div>
                <div class="col-xxl-5 col-xl-6 col-lg-6 col-md-12 login-right pr-0">
                    <div class="mt-60 p-5">
                        {!!
                            $form
                                ->banner('')
                                ->setFormOption('has_wrapper', 'no')
                                ->modify('submit', 'submit', [
                                    'attr' => [
                                        'class' => 'btn btn-green-full text-heading-6',
                                    ],
                                ])
                                ->renderForm()
                        !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
