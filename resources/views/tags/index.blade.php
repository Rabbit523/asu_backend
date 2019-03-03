@extends('adminlte::page')

@section('title', trans('sections.tags'))

@section('content_header')
    <h1>Dashboard</h1>
@stop

@section('content')
    <div class="row margin-bottom-md">
        <div class="col-md-1 col-md-offset-10 text-right">
            @can('tag.store')
                <button type="button" class="btn btn-primary" data-toggle="modal" dusk="create-button" data-target="#create-modal">
                    <b>@lang('messages.create')</b>
                </button>
            @endcan
        </div>
    </div>
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            {{$dataTable->table(['id' => 'tags'])}}
        </div>
    </div>
    @can('tag.store')
        @include('tags.create')
        @include('tags.edit')
    @endcan
@stop

@section('js')
    @can('tag.store')
        <!-- Laravel Javascript Validation -->
        <script type="text/javascript" src="{{ asset('vendor/jsvalidation/js/jsvalidation.js')}}"></script>
        {!! JsValidator::formRequest('App\Http\Requests\ValidateTag', '#create-form') !!}
        {!! JsValidator::formRequest('App\Http\Requests\ValidateTag', '#edit-form') !!}
    @endcan

    <script>
        {{$dataTable->generateScripts()}}

        $( '#edit-modal' ).on( 'show.bs.modal', function (e) {
            let target = e.relatedTarget;

            let tr = $( target ).closest( 'tr' );
            let tagId = $('td', tr).eq(0).text();
            let tagName = $('td', tr).eq(1).text();

            $('input[name=name]', $(this)).val(tagName);

            $("#edit-form").attr('action', route('dashboard.tag.update', tagId));
        });

    </script>
@stop
