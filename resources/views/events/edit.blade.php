<div class="modal fade" tabindex="-1" id="edit-modal" role="dialog" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <legend>@lang('messages.edit_event')</legend>
            </div>
            <div class="modal-body">
                {!! Form::open(['class' => 'form-horizontal', 'id' => 'edit-form', 'method' => 'PUT', 'role'=>'form', 'enctype'=> 'multipart/form-data']) !!}

                <fieldset>

                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12 form-group text-center">      
                                {!! Form::file('picture', ['accept'=>'.png, .jpg, .jpeg']) !!}
                            </div>
                        </div>
                    </div>
                
                    <!-- Name -->
                    <div class="form-group">
                        {!! Form::label('name', 'Name:', ['class' => 'col-lg-2 control-label']) !!}
                        <div class="col-lg-9">
                            {!! Form::text('name', null, ['class' => 'form-control', 'placeholder' => 'Name']) !!}
                        </div>
                    </div>
                    
                    <!-- Address -->
                    <div class="form-group">
                        {!! Form::label('address', 'Address:', ['class' => 'col-lg-2 control-label']) !!}
                        <div class="col-lg-9">
                            {!! Form::text('address', null, ['class' => 'form-control', 'placeholder' => 'Address']) !!}
                        </div>
                    </div>

                    <!-- City -->
                    <div class="form-group">
                        {!! Form::label('city', 'City:', ['class' => 'col-lg-2 control-label']) !!}
                        <div class="col-lg-9">
                            {!! Form::text('city', null, ['class' => 'form-control', 'placeholder' => 'City']) !!}
                        </div>
                    </div>

                    <!-- State -->
                    <div class="form-group">
                        {!! Form::label('state', 'State:', ['class' => 'col-lg-2 control-label']) !!}
                        <div class="col-lg-9">
                            {!! Form::text('state', null, ['class' => 'form-control', 'placeholder' => 'State']) !!}
                        </div>
                    </div>

                    <!-- Zip Code -->
                    <div class="form-group">
                        {!! Form::label('zip_code', 'Zip Code:', ['class' => 'col-lg-2 control-label']) !!}
                        <div class="col-lg-9">
                            {!! Form::text('zip_code', null, ['class' => 'form-control', 'placeholder' => 'Zip Code']) !!}
                        </div>
                    </div>

                    <!-- Tags -->
                    <div class="form-group">
                        {!! Form::label('tags', 'Tags', ['class' => 'col-lg-2 control-label'] )  !!}
                        <div class="col-lg-9">
                            {!!  Form::select('tags[]', [],  null, ['class' => 'form-control', 'multiple']) !!}
                        </div>
                    </div>

                    <!-- Date / Time -->
                    <div class="form-group">
                        {!! Form::label('date', 'Date:', ['class' => 'col-lg-2 control-label']) !!}
                        <div class="col-lg-4">
                            {!! Form::date('date', \Carbon\Carbon::now(), ['class' => 'form-control', 'placeholder' => 'Date']) !!}
                        </div>
                        {!! Form::label('time', 'Time:', ['class' => 'col-lg-1 control-label']) !!}
                        <div class="col-lg-4">
                            {!! Form::time('time', Carbon\Carbon::now()->format('H:i:s'), ['class' => 'form-control', 'placeholder' => 'Time']) !!}
                        </div>
                    </div>

                    <!-- Description -->
                    <div class="form-group">
                        {!! Form::label('description', 'Description:', ['class' => 'col-lg-2 control-label']) !!}
                        <div class="col-lg-9">
                            {!! Form::textarea('description', null, ['class' => 'form-control', 'placeholder' => 'Description']) !!}
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="form-group">
                        <div class="col-lg-9 col-lg-offset-2">
                            {!! Form::submit('Submit', ['class' => 'btn btn-md btn-primary pull-right', 'dusk' => 'edit-submit'] ) !!}
                        </div>
                    </div>
                    
                    </fieldset>
                
                {!! Form::close()  !!}
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->