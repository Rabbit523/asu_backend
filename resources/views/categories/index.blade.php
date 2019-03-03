@extends('adminlte::page')

@section('title', trans('sections.categories'))

@section('content_header')
    <h1>Dashboard</h1>
@stop

@section('content')
    <div class="row margin-bottom-md">
        <div class="col-md-1 col-md-offset-10 text-right">
            @can('category.store')
                <button type="button" class="btn btn-primary" data-toggle="modal" dusk="create-button" data-target="#create-modal">
                    <b>@lang('messages.create')</b>
                </button>
            @endcan
        </div>
    </div>
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            {{$dataTable->table(['id' => 'category'])}}
        </div>
    </div>
    @can('category.store')
        @include('categories.create')
    @endcan

    @can('category.update')
        @include('categories.edit')
    @endcan
@stop

@section('js')
    <script type="text/javascript" src="{{ asset('vendor/jsvalidation/js/jsvalidation.js')}}"></script>

    @can('category.store')
        {!! JsValidator::formRequest('App\Http\Requests\ValidateCategory', '#create-form') !!}
    @endcan
    @can('category.update')
        {!! JsValidator::formRequest('App\Http\Requests\ValidateCategory', '#edit-form') !!}
    @endcan

    <script>
        {{$dataTable->generateScripts()}}

        $( '#edit-modal' ).on( 'show.bs.modal', function (e) {
            let target = e.relatedTarget;

            let tr = $( target ).closest( 'tr' );
            let categoryId = $('td', tr).eq(0).text();

            $.ajax({
                type: 'GET',
                url: route('dashboard.category.show', categoryId),
                success: function (data) {
                    $('[name=name]', '#edit-form').val(data['name']);
                    $('select[name="tags[]"]', '#edit-form').html('');
                    $.each(data['tags'], function(key, value) {
                        $('select[name="tags[]"]', '#edit-form')
                            .append($('<option></option>')
                                        .attr('value', value.id)
                                        .attr('selected', 'selected')
                                        .text(value.text));
                    });
                    $('#edit-form input[name=required]').attr('checked', !!data['required'])
                },
            });

            $("#edit-form").attr('action', route('dashboard.category.update', categoryId));
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
                            type: 'channel',
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
