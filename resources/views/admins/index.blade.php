@extends('adminlte::page')

@section('title', trans('sections.administrators'))

@section('content_header')
    <h1>Dashboard</h1>
@stop

@section('content')
    <div class="row margin-bottom-md">
        <div class="col-md-1 col-md-offset-10 text-right">
            @can('admin.store')
                <button type="button" class="btn btn-primary" data-toggle="modal" dusk="create-button" data-target="#create-modal">
                    <b>@lang('messages.create')</b>
                </button>
            @endcan
        </div>
    </div>
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            {{$dataTable->table(['id' => 'admin'])}}
        </div>
    </div>

    @can('admin.store')
        @include('admins.create')
    @endcan
@stop

@section('js')
    @can('admin.store')
        <!-- Laravel Javascript Validation -->
        <script type="text/javascript" src="{{ asset('vendor/jsvalidation/js/jsvalidation.js')}}"></script>
        {!! JsValidator::formRequest('App\Http\Requests\StoreAdministrator', '#create-form') !!}
    @endcan

    <script>
        {{$dataTable->generateScripts()}}
    </script>
@stop
