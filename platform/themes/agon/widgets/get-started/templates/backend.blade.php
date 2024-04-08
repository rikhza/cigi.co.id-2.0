<div class="mb-3">
    <label>{{ trans('core/base::forms.name') }}</label>
    <input type="text" class="form-control" name="name" value="{{ $config['name'] }}">
</div>

<div class="mb-3">
    <label>{{ __('Title') }}</label>
    <input type="text" class="form-control" name="title" value="{{ $config['title'] }}">
</div>

<div class="mb-3">
    <label>{{ __('Image') }}</label>
    {!! Form::mediaImage('image', $config['image']) !!}
</div>

<div class="mb-3">
    <label>{{ __('Image link') }}</label>
    <input type="text" class="form-control" name="image_link" value="{{ $config['image_link'] }}">
</div>

<div class="mb-3">
    <label>{{ __('Link') }}</label>
    <input type="text" class="form-control" name="link" value="{{ $config['link'] }}">
</div>

<div class="mb-3">
    <label>{{ __('Text link') }}</label>
    <input type="text" class="form-control" name="text_link" value="{{ $config['text_link'] }}">
</div>

