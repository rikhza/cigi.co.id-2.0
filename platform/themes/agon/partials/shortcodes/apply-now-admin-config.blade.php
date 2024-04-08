<section>
    <div class="mb-3">
        <label>{{ __('Title') }}</label>
        <input type="text" class="form-control" name="title" value="{{ Arr::get($attributes, 'title') }}">
    </div>

    <div class="mb-3">
        <label>{{ __('Subtitle') }}</label>
        <input type="text" class="form-control" name="subtitle" value="{{ Arr::get($attributes, 'subtitle') }}">
    </div>

    <div class="mb-3">
        <label>{{ __('Primary URL') }}</label>
        <input type="text" class="form-control" name="primary_url" value="{{ Arr::get($attributes, 'primary_url') }}">
    </div>

    <div class="mb-3">
        <label>{{ __('Primary Title') }}</label>
        <input type="text" class="form-control" name="primary_title" value="{{ Arr::get($attributes, 'primary_title') }}">
    </div>

    <div class="mb-3">
        <label>{{ __('Secondary URL') }}</label>
        <input type="text" class="form-control" name="secondary_url" value="{{ Arr::get($attributes, 'secondary_url') }}">
    </div>

    <div class="mb-3">
        <label>{{ __('Secondary Title') }}</label>
        <input type="text" class="form-control" name="secondary_title" value="{{ Arr::get($attributes, 'secondary_title') }}">
    </div>
</section>
