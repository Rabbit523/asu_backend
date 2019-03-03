@extends('adminlte::page')

@section('title', trans('sections.jobs'))

@section('content_header')
    <h1>Dashboard</h1>
@stop

@section('content')
    <div class="row margin-bottom-md">
        <div class="col-md-1 col-md-offset-10 text-right">
            @can('job.store')
                <button type="button" class="btn btn-primary" data-toggle="modal" dusk="create-button" data-target="#create-modal">
                    <b>@lang('messages.create')</b>
                </button>
            @endcan
        </div>
    </div>
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            {{$dataTable->table(['id' => 'job'])}}
        </div>
    </div>
    @can('job.store')
        @include('jobs.create')
        @include('jobs.edit')
    @endcan
@stop

@section('js')
    @can('job.store')
        <!-- Laravel Javascript Validation -->
        <script type="text/javascript" src="{{ asset('vendor/jsvalidation/js/jsvalidation.js')}}"></script>
        {!! JsValidator::formRequest('App\Http\Requests\ValidateJob', '#create-form') !!}
        {!! JsValidator::formRequest('App\Http\Requests\ValidateJob', '#edit-form') !!}
    @endcan

    <script>
        {{$dataTable->generateScripts()}}

        $( '#edit-modal' ).on( 'show.bs.modal', function (e) {
            let target = e.relatedTarget;

            let tr = $( target ).closest( 'tr' );
            let jobId = $('td', tr).eq(0).text();

            $.ajax({
                type: 'GET',
                url: route('dashboard.job.show', jobId),
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

            $("#edit-form").attr('action', route('dashboard.job.update', jobId));
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
                            type: 'job',
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
