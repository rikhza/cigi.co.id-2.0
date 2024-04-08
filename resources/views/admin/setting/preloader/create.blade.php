@extends('layouts.admin.master')

@section('content')

    <!-- Form row -->
    <div class="row">
        <div class="col-xl-12 box-margin height-card">
            <div class="card card-body">
                <h4 class="card-title">{{ __('content.preloader') }}</h4>
            @if (isset($preloader))
                @if ($demo_mode == "on")
                    <!-- Include Alert Blade -->
                        @include('admin.demo_mode.demo-mode')
                    @else
                        <form action="{{ route('preloader.update', $preloader->id) }}" method="POST">
                            @method('PUT')
                            @csrf
                            @endif

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="preloader_text">{{ __('content.preloader_text') }}</label>
                                        <input type="text" name="preloader_text" class="form-control" id="preloader_text" value="{{ $preloader->preloader_text }}">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="subtitle">{{ __('content.subtitle') }}</label>
                                        <input type="text" name="subtitle" class="form-control" id="subtitle" value="{{ $preloader->subtitle }}">
                                    </div>
                                </div>
                                <div class="col-xl-12">
                                    <div class="form-group">
                                        <label for="status" class="col-form-label">{{ __('content.status') }} </label>
                                        <select class="form-control" name="status" id="status">
                                            <option value="enable" selected>{{ __('content.select_your_option') }}</option>
                                            <option value="enable" {{ $preloader->status == 'enable' ? 'selected' : '' }}>{{ __('content.enable') }}</option>
                                            <option value="disable" {{ $preloader->status == 'disable' ? 'selected' : '' }}>{{ __('content.disable') }}</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <button type="submit" class="btn btn-primary mr-2">{{ __('content.submit') }}</button>
                                    <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#preloaderDestroyModal{{ $preloader->id }}">
                                        <i class="fa fa-trash"></i> {{ __('content.reset') }}
                                    </a>
                                </div>
                            </div>
                        </form>

                        <!-- Modal -->
                        <div class="modal fade" id="preloaderDestroyModal{{ $preloader->id }}" tabindex="-1" role="dialog" aria-labelledby="preloaderDestroyModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="preloaderDestroyModalCenterTitle">{{ __('content.delete') }}</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="{{ __('content.close') }}">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body text-center">
                                        {{ __('content.you_wont_be_able_to_revert_this') }}
                                    </div>
                                    <div class="modal-footer">
                                        @if ($demo_mode == "on")
                                            <!-- Include Alert Blade -->
                                            @include('admin.demo_mode.demo-mode')
                                        @else
                                            <form class="d-inline-block" action="{{ route('preloader.destroy', $preloader->id) }}" method="POST">
                                                @method('DELETE')
                                                @csrf
                                                @endif

                                            <button type="button" class="btn btn-danger mr-1" data-dismiss="modal">{{ __('content.cancel') }}</button>
                                            <button type="submit" class="btn btn-success">{{ __('content.yes_delete_it') }}</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                    @else
                            @if ($demo_mode == "on")
                            <!-- Include Alert Blade -->
                                @include('admin.demo_mode.demo-mode')
                            @else
                                <form action="{{ route('preloader.store') }}" method="POST">
                                    @csrf
                                    @endif

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="preloader_text">{{ __('content.preloader_text') }}</label>
                                                <input type="text" name="preloader_text" class="form-control" id="preloader_text">
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="subtitle">{{ __('content.subtitle') }}</label>
                                                <input type="text" name="subtitle" class="form-control" id="subtitle">
                                            </div>
                                        </div>
                                        <div class="col-xl-12">
                                            <div class="form-group">
                                                <label for="status" class="col-form-label">{{ __('content.status') }} </label>
                                                <select class="form-control" name="status" id="status">
                                                    <option value="enable" selected>{{ __('content.select_your_option') }}</option>
                                                    <option value="enable">{{ __('content.enable') }}</option>
                                                    <option value="disable">{{ __('content.disable') }}</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <button type="submit" class="btn btn-primary mr-2">{{ __('content.submit') }}</button>
                                        </div>
                                    </div>
                                </form>
                            @endif
            </div>
        </div>
    </div>
    <!-- end row -->

@endsection
