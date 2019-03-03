@extends('adminlte::page')

@section('title', trans('sections.channels'))

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

    @can('channel.store')
        @include('channels.create')
        @include('channels.edit')
    @endcan
@stop

@section('js')
    @can('channel.store')
        <!-- Laravel Javascript Validation -->
        <script type="text/javascript" src="{{ asset('vendor/jsvalidation/js/jsvalidation.js')}}"></script>
        {!! JsValidator::formRequest('App\Http\Requests\ValidateChannel', '#create-form') !!}
        {!! JsValidator::formRequest('App\Http\Requests\ValidateChannel', '#edit-form') !!}
    @endcan

    <script>
        {{$dataTable->generateScripts()}}

        $( '#edit-modal' ).on( 'show.bs.modal', function (e) {
            let target = e.relatedTarget;

            let tr = $( target ).closest( 'tr' );
            let channelId = $('td', tr).eq(0).text();

            $.ajax({
                type: 'GET',
                url: route('dashboard.channel.show', channelId),
                success: function (data) {
                    $('[name=name]', '#edit-form').val(data['name']);
                    $('#edit-form input[name=is_public]').attr('checked', data['is_public']);
                    if (data['is_public']) {
                        $( 'input[name="required"]' ).removeAttr('disabled');
                    }
                    $('#edit-form input[name=required]').attr('checked', !!data['required']);
                    $(`#edit-form select[name="categories"] option[value="${data['category']}"`).attr('selected','selected');
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

            $("#edit-form").attr('action', route('dashboard.channel.update', channelId));
        });

        $('select[name="categories"]').on('change', function () {
            $('select[name="tags[]"]').html('');
        });

        $('input[name="is_public"]').on('change', function () {
            if(this.checked) {
                $( 'input[name="required"]' ).removeAttr('disabled');
            }else {
                $( 'input[name="required"]' ).prop( 'checked', false );
                $( 'input[name="required"]' ).attr('disabled','disabled');

            }
        });

        $(document).ready(function() {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $('select[name="tags[]"]').select2({
                placeholder: "Choose some tags...",
                ajax: {
                    url: route('dashboard.tag.filter-by-category'),
                    dataType: 'json',
                    delay: 400,
                    data: function(params) {
                        category = $(this)
                                    .closest('form')
                                    .find('select[name="categories"]')
                                    .val();
                        return {
                            term: params.term,
                            category: category
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
