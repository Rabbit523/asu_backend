@extends('adminlte::page')

@section('title', trans('sections.feeds'))

@section('content_header')
    <h1>Dashboard</h1>
@stop

@section('content')
    <div class="row margin-bottom-md">
        <div class="col-md-1 col-md-offset-10 text-right">
            @can('feed.store')
                <button type="button" class="btn btn-primary" data-toggle="modal" dusk="create-button" data-target="#create-modal">
                    <b>@lang('messages.create')</b>
                </button>
            @endcan
        </div>
    </div>
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            {{$dataTable->table(['id' => 'feed'])}}
        </div>
    </div>
    @can('feed.store')
        @include('feeds.create')
        @include('feeds.edit')
    @endcan
@stop

@section('js')
    @can('feed.store')
        <!-- Laravel Javascript Validation -->
        <script type="text/javascript" src="{{ asset('vendor/jsvalidation/js/jsvalidation.js')}}"></script>
        {!! JsValidator::formRequest('App\Http\Requests\ValidateSocialMediaFeed', '#create-form') !!}
        {!! JsValidator::formRequest('App\Http\Requests\ValidateSocialMediaFeed', '#edit-form') !!}
    @endcan

    <script>
        {{$dataTable->generateScripts()}}

        $( '#edit-modal' ).on( 'show.bs.modal', function (e) {
            let target = e.relatedTarget;

            let tr = $( target ).closest( 'tr' );
            let feedId = $('td', tr).eq(0).text();

            $( '#edit-form input[name=name]' ).val( $('td', tr).eq(1).text() );
            $( '#edit-form input[name=url]' ).val( $('td', tr).eq(2).text() );

            $("#edit-form").attr('action', route('dashboard.feed.update', {feed: feedId}));
        });
    </script>
@stop
