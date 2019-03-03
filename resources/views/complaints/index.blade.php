@extends('adminlte::page')

@section('title', trans('sections.complaints'))

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
            {{$dataTable->table(['id' => 'complaints'])}}
        </div>
    </div>
    @can('complaint.show-user')
        @include('complaints.show-user')
    @endcan

    @can('complaint.show-content')
        @include('complaints.show-content')
    @endcan
@stop

@section('js')
    <script>
        {{$dataTable->generateScripts()}}

        $(document.body).on('click', 'a[data-type="user"]', function (event) {
            let userId = $(this).data( 'id' );

            $.ajax({
                type: 'GET',
                url: route('dashboard.complaint.show-user', userId),
                success: function (data) {
                    $.each(data.data, function(key, value){
                        $(`[name=${key}]`, '#show-user-modal').val(value);
                    });
                },
            });
        });

        $(document.body).on('click', 'a[data-type="content"]', function (event) {
            let reportId = $( this ).closest( 'tr' ).find( 'td' ).eq(0).text();

            $.ajax({
                headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                url: route('dashboard.complaint.show-content', reportId),
                type: 'POST',
                success:function(data) {
                    $.each(data, function(key, value){
                        $(`div.content-${key}`, '#show-content-modal').html(value);
                    });
                }
            });
        });

    </script>
@stop
