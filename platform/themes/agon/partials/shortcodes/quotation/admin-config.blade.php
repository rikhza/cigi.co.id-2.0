<section>
    <div class="mb-3">
        <label class="form-label">{{ __('Title') }}</label>
        <input type="text" name="title" value="{{ Arr::get($attributes, 'title') }}" class="form-control" placeholder="{{ __('Title') }}">
    </div>

    <div class="mb-3">
        <label class="form-label">{{ __('Subtitle') }}</label>
        <input type="text" name="subtitle" value="{{ Arr::get($attributes, 'subtitle') }}" class="form-control" placeholder="{{ __('Subtitle') }}">
    </div>

    <div class="mb-3">
        <label class="form-label">{{ __('Background image :number', ['number' => 1]) }}</label>
        {!! Form::mediaImage('background_image_1', Arr::get($attributes, 'background_image_1')) !!}
    </div>

    <div class="mb-3">
        <label class="form-label">{{ __('Background image :number', ['number' => 2]) }}</label>
        {!! Form::mediaImage('background_image_2', Arr::get($attributes, 'background_image_2')) !!}
    </div>

    <div class="mb-3">
        <label class="form-label">{{ __('Background color') }}</label>
        {!! Form::customColor('background_color', Arr::get($attributes, 'background_color'), ['class' => 'form-control']) !!}
    </div>

    <div class="mb-3">
        <label class="form-label">{{ __('Primary Button Title') }}</label>
        <input name="primary_title" value="{{ Arr::get($attributes, 'primary_title') }}" class="form-control" />
    </div>

    <div class="mb-3">
        <label class="form-label">{{ __('Primary Button URL') }}</label>
        <input name="primary_url" value="{{ Arr::get($attributes, 'primary_url') }}" class="form-control" />
    </div>

    <div class="mb-3">
        <label class="form-label">{{ __('Secondary Button Title') }}</label>
        <input name="secondary_title" value="{{ Arr::get($attributes, 'secondary_title') }}" class="form-control" />
    </div>

    <div class="mb-3">
        <label class="form-label">{{ __('Secondary Button URL') }}</label>
        <input name="secondary_url" value="{{ Arr::get($attributes, 'secondary_url') }}" class="form-control" />
    </div>

    <div class="mb-3">
        <label class="form-label">{{ __('Style') }}</label>
        {!! Form::customSelect('style', [
                'style-1' => __('Style 1'),
                'style-2' => __('Style 2'),
            ], Arr::get($attributes, 'style')) !!}
    </div>

    @php
        $fields = [
            'title' => [
                'title' => __('Title'),
            ],
            'subtitle' => [
                'title' => __('Subtitle'),
            ],
            'month_price' => [
                'title' => __('Month price'),
            ],
            'year_price' => [
                'title' => __('Year price'),
            ],
            'link' => [
                'title'       => __('Link'),
                'placeholder' => __('Learn more Link'),
            ],
            'title_link' => [
                'title'       => __('Title link'),
                'placeholder' => __('Title link'),
            ],
            'checked' => [
                'title'       => __('Checked list'),
                'placeholder' => __('Enter a list with checked, separated by semicolons'),
            ],
            'uncheck' => [
                'title'       => __('Uncheck list'),
                'placeholder' => __('Enter a list with unchecked, separated by semicolons'),
            ],
            'active' => [
                'type'        => 'checkbox',
                'title'       => __('Is active?'),
            ],
        ];
    @endphp

    {!! Theme::partial('shortcodes.partials.tabs', compact('fields', 'attributes')) !!}
</section>
