@extends('layouts.admin.master')

@section('content')

    <!-- Form row -->
    <div class="row">
        <div class="col-xl-12 box-margin height-card">
            <div class="card card-body">
                <div class="d-md-flex justify-content-between align-items-center mb-20">
                    <h4 class="card-title">{{ __('content.edit_blog') }}</h4>
                    <div>
                        <a href="{{ url()->previous() }}"  class="btn btn-primary"><i class="fas fa-angle-left"></i> {{ __('content.back') }}</a>
                    </div>
                </div>
            @if ($demo_mode == "on")
                <!-- Include Alert Blade -->
                    @include('admin.demo_mode.demo-mode')
                @else
                    <form action="{{ route('blog.update', $blog->id) }}" method="POST" enctype="multipart/form-data">
                        @method('PUT')
                        @csrf
                        @endif

                    <div class="row">
                        <div class="col-md-8">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="title">{{ __('content.title') }} <span class="text-red">*</span></label>
                                        <input id="title" name="title" type="text" class="form-control" value="{{ $blog->title }}" required>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="summernote">{{ __('content.description') }}</label>
                                        <textarea id="summernote" name="description" class="form-control">@php echo html_entity_decode($blog->description); @endphp</textarea>
                                    </div>
                                </div>
                                <div class="col-md-12 box-margin">
                                    <div id="accordion-">
                                        <div class="card mb-2">
                                            <div class="card-header bg-secondary">
                                                <a class="collapsed text-white" data-toggle="collapse" href="#accordion-1" aria-expanded="false">
                                                    {{ __('content.seo_optimization') }}
                                                </a>
                                            </div>

                                            <div id="accordion-1" class="collapse" data-parent="#accordion-" style="">
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label for="meta_description">{{ __('content.meta_description') }} </label>
                                                                <input id="meta_description" name="meta_description" type="text" class="form-control" value="{{ $blog->meta_description }}">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label for="meta_keyword">{{ __('content.meta_keyword') }} ({{ __('content.separate_with_commas') }})</label>
                                                                <textarea id="meta_keyword" name="meta_keyword" class="form-control">{{ $blog->meta_keyword }}</textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="category" class="col-form-label">{{ __('content.categories') }} <span class="text-red">*</span></label>
                                        <select class="form-control" name="category_id" id="category" required>
                                            @foreach ($categories as $category)
                                                <option value="{{ $category->id}}" {{ $category->id == $blog->category_id ? 'selected' : '' }}>{{ $category->category_name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="short_description">{{ __('content.short_description') }}</label>
                                        <textarea id="short_description" name="short_description" class="form-control" rows="3">{{ $blog->short_description }}</textarea>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="tag-list">{{ __('content.tag') }} ({{ __('content.separate_with_commas') }})</label>
                                        <textarea id="tag-list" name="tag" class="form-control">{{ $blog->tag }}</textarea>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="type" class="col-form-label">{{ __('content.author') }} </label>
                                        <select class="form-control" name="type" id="type">
                                            <option value="with_this_account" selected>{{ __('content.select_your_option') }}</option>
                                            <option value="with_this_account" {{ $blog->type == "with_this_account" ? 'selected' : '' }}>{{ __('content.with_this_account') }}</option>
                                            <option value="anonymous" {{ $blog->type == "anonymous" ? 'selected' : '' }}>{{ __('content.anonymous') }}</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="section_image">{{ __('content.image') }} ({{ __('content.size') }} 415 x 300) (.svg, .jpg, .jpeg, .png, .webp)</label>
                                        <input type="file" name="section_image" class="form-control-file" id="section_image">
                                        <small class="form-text text-muted">{{ __('content.please_use_recommended_sizes') }}</small>
                                    </div>
                                    <div class="height-card box-margin">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="avatar-area text-center">
                                                    <div class="media">
                                                        @if (!empty($blog->section_image))
                                                            <a  class="d-block mx-auto" href="#" data-toggle="tooltip" data-placement="top" data-original-title="{{ __('content.current_image') }}">
                                                                <img src="{{ asset('uploads/img/blog/thumbnail/'.$blog->section_image) }}" alt="blog image" class="rounded w-25">
                                                            </a>
                                                        @else
                                                            <a class="d-block mx-auto" href="#" data-toggle="tooltip" data-placement="top" data-original-title="{{ __('content.not_yet_created') }}">
                                                                <img src="{{ asset('uploads/img/dummy/no-image.jpg') }}" alt="no image" class="rounded w-25">
                                                            </a>
                                                        @endif
                                                    </div>
                                                    @if (!empty($blog->section_image))
                                                        <a class="mt-3 d-block" href="#" data-toggle="modal" data-target="#deleteImageModal{{ $blog->id }}">
                                                            <i class="fa fa-trash text-danger font-18"></i>
                                                        </a>
                                                    @endif
                                                </div>
                                                <!--end card-body-->
                                            </div>
                                        </div>
                                        <!--end card-->
                                    </div>
                                    <!--end col-->
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="section_image_2">{{ __('content.image') }} ({{ __('content.size') }} 820 x 500) (.svg, .jpg, .jpeg, .png, .webp)</label>
                                        <input type="file" name="section_image_2" class="form-control-file" id="section_image_2">
                                        <small class="form-text text-muted">{{ __('content.please_use_recommended_sizes') }}</small>
                                    </div>
                                    <div class="height-card box-margin">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="avatar-area text-center">
                                                    <div class="media">
                                                        @if (!empty($blog->section_image_2))
                                                            <a  class="d-block mx-auto" href="#" data-toggle="tooltip" data-placement="top" data-original-title="{{ __('content.current_image') }}">
                                                                <img src="{{ asset('uploads/img/blog/'.$blog->section_image_2) }}" alt="blog image" class="rounded w-25">
                                                            </a>
                                                        @else
                                                            <a class="d-block mx-auto" href="#" data-toggle="tooltip" data-placement="top" data-original-title="{{ __('content.not_yet_created') }}">
                                                                <img src="{{ asset('uploads/img/dummy/no-image.jpg') }}" alt="no image" class="rounded w-25">
                                                            </a>
                                                        @endif
                                                    </div>
                                                    @if (!empty($blog->section_image_2))
                                                        <a class="mt-3 d-block" href="#" data-toggle="modal" data-target="#deleteImageModal2{{ $blog->id }}">
                                                            <i class="fa fa-trash text-danger font-18"></i>
                                                        </a>
                                                    @endif
                                                </div>
                                                <!--end card-body-->
                                            </div>
                                        </div>
                                        <!--end card-->
                                    </div>
                                    <!--end col-->
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="order">{{ __('content.order') }}</label>
                                        <input type="number" name="order" class="form-control" id="order" value="{{ $blog->order }}" required>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="status" class="col-form-label">{{ __('content.status') }}</label>
                                        <select class="form-control" name="status" id="status">
                                            <option value="published" selected>{{ __('content.select_your_option') }}</option>
                                            <option value="published" {{ $blog->status == "published" ? 'selected' : '' }}>{{ __('content.published') }}</option>
                                            <option value="draft" {{ $blog->status == "draft" ? 'selected' : '' }}>{{ __('content.draft') }}</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <small class="form-text text-muted">{{ __('content.required_fields') }}</small>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <button type="submit" class="btn btn-primary mr-2">{{ __('content.submit') }}</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                    <!-- Modal -->
                    <div class="modal fade" id="deleteImageModal{{ $blog->id }}" tabindex="-1" role="dialog" aria-labelledby="messageModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="messageModalCenterTitle">{{ __('content.delete') }}</h5>
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
                                        <form class="d-inline-block" action="{{ route('blog.destroy_image', $blog->id) }}" method="POST">
                                            @method('DELETE')
                                            @csrf
                                            @endif

                                        <button type="button" class="btn btn-danger" data-dismiss="modal">{{ __('content.cancel') }}</button>
                                        <button type="submit" class="btn btn-success">{{ __('content.yes_delete_it') }}</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal -->
                    <div class="modal fade" id="deleteImageModal2{{ $blog->id }}" tabindex="-1" role="dialog" aria-labelledby="messageModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="messageModalCenterTitle">{{ __('content.delete') }}</h5>
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
                                        <form class="d-inline-block" action="{{ route('blog.destroy_image_2', $blog->id) }}" method="POST">
                                            @method('DELETE')
                                            @csrf
                                            @endif

                                        <button type="button" class="btn btn-danger" data-dismiss="modal">{{ __('content.cancel') }}</button>
                                        <button type="submit" class="btn btn-success">{{ __('content.yes_delete_it') }}</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>


            </div>
        </div>
    </div>
    <!-- end row -->

@endsection
