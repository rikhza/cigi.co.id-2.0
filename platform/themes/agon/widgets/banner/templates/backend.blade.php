<div class="mb-3">
    <label>{{ trans('core/base::forms.name') }}</label>
    <input type="text" class="form-control" name="name" value="{{ $config['name'] }}">
</div>

<div class="mb-3">
    <label>{{ __('Title') }}</label>
    <input type="text" class="form-control" name="title" value="{{ $config['title'] }}">
</div>

<div class="mb-3">
    <label>{{ __('Subtitle') }}</label>
    <textarea name="subtitle"  rows="3" class="form-control">{{ $config['subtitle'] }}</textarea>
</div>

<div class="mb-3">
    <label>{{ __('Link') }}</label>
    <input type="text" class="form-control" name="link" value="{{ $config['link'] }}">
</div>

<div class="mb-3">
    <label>{{ __('Image') }}</label>
    {!! Form::mediaImage('image', $config['image']) !!}
</div>
