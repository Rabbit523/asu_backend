@extends('adminlte::page')

@section('title', trans('sections.events'))

@section('content_header')
    <h1>Dashboard</h1>
@stop

@section('content')
    <div class="row margin-bottom-md">
        <div class="col-md-1 col-md-offset-10 text-right">
            @can('event.store')
                <button type="button" class="btn btn-primary" data-toggle="modal" dusk="create-button" data-target="#create-modal">
                    <b>@lang('messages.create')</b>
                </button>
            @endcan
        </div>
    </div>
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            {{$dataTable->table(['id' => 'event'])}}
        </div>
    </div>
    @can('event.store')
        @include('events.create')
        @include('events.edit')
        @include('partials.show-picture')
    @endcan
@stop

@section('js')
    @can('event.store')
        <!-- Laravel Javascript Validation -->
        <script type="text/javascript" src="{{ asset('vendor/jsvalidation/js/jsvalidation.js')}}"></script>
        {!! JsValidator::formRequest('App\Http\Requests\ValidateEvent', '#create-form') !!}
        {!! JsValidator::formRequest('App\Http\Requests\ValidateEvent', '#edit-form') !!}
    @endcan

    <script>
        {{$dataTable->generateScripts()}}

        $( '#edit-modal' ).on( 'show.bs.modal', function (e) {
            let target = e.relatedTarget;

            let tr = $( target ).closest( 'tr' );
            let eventId = $('td', tr).eq(0).text();
            let imageUrl = $('a[name=picture-link]', $(tr)).data('url');

            $('input[name=picture]', $(this)).attr({'value':imageUrl})

            $.ajax({
                type: 'GET',
                url: route('dashboard.event.show', eventId),
                success: function (data) {
                    $.each(data, function(key, value){
                        $(`[name=${key}]`, '#edit-form').val(value);
                    });
                    $('select[name="tags[]"]', '#edit-form').html('');
                    $.each(data['tags'], function(key, value) {
                        $('select[name="tags[]"]', '#edit-form')
                            .append($('<option></option>')
                                        .attr('value', value.id)
                                        .attr('selected', 'selected')
                                        .text(value.text));
                    });
                },
            });

            $("#edit-form").attr('action', route('dashboard.event.update', eventId));
        });

        $(document.body).on('click', 'a[name="picture-link"]', function (event) {
            event.preventDefault();

            let modal = $('#show-picture');

            let content = $('img', modal);
            content.attr("src", $(this).data('url'));
        });

        $(document).ready(function() {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $('select[name="tags[]"]').select2({
                placeholder: "Choose some tags...",
                minimumInputLength: 2,
                ajax: {
                    url: route('dashboard.tag.filter'),
                    dataType: 'json',
                    delay: 400,
                    data: function(params) {
                        return {
                            term: params.term,
                            type: 'event',
                            is_category: true
                        }
                    },
                    processResults: function (data) {
                        return {
                            results: data
                        };
                    },
                },
                tempalteSelection: function (repo) {
                    return repo.id;
                }
            });
        });

    </script>
@stop
