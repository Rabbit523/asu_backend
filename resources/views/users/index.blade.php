@extends('adminlte::page')

@section('title', trans('sections.users'))

@section('content_header')
    <h1>Dashboard</h1>
@stop

@section('content')
    <div class="row margin-bottom-md">
        <div class="col-md-1 col-md-offset-10 text-right">
        </div>
    </div>
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            {{$dataTable->table(['id' => 'user'])}}
        </div>
    </div>
    @can('feed.store')
        @include('users.password-reset')
    @endcan
@stop

@section('js')

    @can('user.password-reset')
        <!-- Laravel Javascript Validation -->
        <script type="text/javascript" src="{{ asset('vendor/jsvalidation/js/jsvalidation.js')}}"></script>
        {!! JsValidator::formRequest('App\Http\Requests\ValidateUser', '#password-reset-form') !!}
    @endcan

    <script>
        {{$dataTable->generateScripts()}}

        $( '#password-reset-modal' ).on( 'show.bs.modal', function (event) {
            let target = event.relatedTarget;

            let tr = $( target ).closest( 'tr' );

            $( '#password-reset-form input[name=email]' ).val( $('td', tr).eq(2).text() );

            $( '#password-reset-form' ).attr('action', route('dashboard.user.password-reset'));
        });

    </script>
@stop
