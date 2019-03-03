<div class="modal fade" tabindex="-1" id="create-modal" role="dialog" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <legend>@lang('messages.new_job')</legend>
            </div>
            <div class="modal-body">
                {!! Form::open(['class' => 'form-horizontal', 'id' => 'create-form', 'method' => 'POST', 'role'=>'form']) !!}

                <fieldset>
                    
                    <!-- Title -->
                    <div class="form-group">
                        {!! Form::label('title', 'Title:', ['class' => 'col-lg-2 control-label']) !!}
                        <div class="col-lg-9">
                            {!! Form::text('title', null, ['class' => 'form-control', 'placeholder' => 'Title']) !!}
                        </div>
                    </div>

                    <!-- Description -->
                    <div class="form-group">
                        {!! Form::label('description', 'Description:', ['class' => 'col-lg-2 control-label']) !!}
                        <div class="col-lg-9">
                            {!! Form::textarea('description', null, ['class' => 'form-control', 'placeholder' => 'Description']) !!}
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

                    <!-- Company -->
                    <div class="form-group">
                        {!! Form::label('company', 'Company:', ['class' => 'col-lg-2 control-label']) !!}
                        <div class="col-lg-9">
                            {!! Form::text('company', null, ['class' => 'form-control', 'placeholder' => 'Company']) !!}
                        </div>
                    </div>

                    <!-- URL -->
                    <div class="form-group">
                        {!! Form::label('url', 'URL:', ['class' => 'col-lg-2 control-label']) !!}
                        <div class="col-lg-9">
                            {!! Form::text('url', null, ['class' => 'form-control', 'placeholder' => 'URL']) !!}
                        </div>
                    </div>

                    <!-- Tags -->
                    <div class="form-group">
                        {!! Form::label('tags', 'Tags', ['class' => 'col-lg-2 control-label'] )  !!}
                        <div class="col-lg-9">
                            {!!  Form::select('tags[]', [],  null, ['class' => 'form-control', 'multiple']) !!}
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="form-group">
                        <div class="col-lg-9 col-lg-offset-2">
                            {!! Form::submit('Submit', ['class' => 'btn btn-md btn-primary pull-right', 'dusk' => 'create-submit'] ) !!}
                        </div>
                    </div>
                
                </fieldset>
                
                {!! Form::close()  !!}
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->