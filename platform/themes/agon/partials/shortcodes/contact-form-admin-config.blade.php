<div class="mb-3">
    <label class="form-label">{{ __('Title') }}</label>
    <input type="text" name="title" value="{{ Arr::get($attributes, 'title') }}" class="form-control" placeholder="{{ __('Title') }}">
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Subtitle') }}</label>
    <input type="text" name="subtitle" value="{{ Arr::get($attributes, 'subtitle') }}" class="form-control" placeholder="{{ __('Subtitle') }}">
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Highlight') }}</label>
    <input type="text" name="highlight" value="{{ Arr::get($attributes, 'highlight') }}" class="form-control" placeholder="{{ __('Highlight') }}">
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Image') }}</label>
    {!! Form::mediaImage('image', Arr::get($attributes, 'image')) !!}
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Name') }}</label>
    <input type="text" name="name" value="{{ Arr::get($attributes, 'name') }}" class="form-control" placeholder="{{ __('Name') }}">
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Address') }}</label>
    <input type="text" name="address" value="{{ Arr::get($attributes, 'address') }}" class="form-control" placeholder="{{ theme_option('address') }}">
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Phone') }}</label>
    <input type="text" name="phone" value="{{ Arr::get($attributes, 'phone') }}" class="form-control" placeholder="{{ theme_option('hotline') }}">
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Email') }}</label>
    <input type="email" name="email" value="{{ Arr::get($attributes, 'email') }}" class="form-control" placeholder="{{ theme_option('email') }}">
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Background color') }}</label>
    {!! Form::customColor('bg_color', Arr::get($attributes, 'bg_color')) !!}
</div>
