<div class="mb-3">
    <label class="form-label">{{ __('Select category') }}</label>
    {!! Form::customSelect('category_id', $categories) !!}
</div>


<div class="mb-3">
    <label class="form-label">{{ __('Limit number of products') }}</label>
    <input type="number" name="limit" value="{{ Arr::get($attributes, 'limit') }}" class="form-control" placeholder="{{  __('Default: 3') }}">
</div>
