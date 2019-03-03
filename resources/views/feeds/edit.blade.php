<div class="modal fade" tabindex="-1" id="edit-modal" role="dialog" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <legend>@lang('messages.edit_feed')</legend>
            </div>
            <div class="modal-body">
                {!! Form::open(['class' => 'form-horizontal', 'id' => 'edit-form', 'method' => 'PUT', 'role'=>'form']) !!}

                <fieldset>
                    
                    <!-- Name -->
                    <div class="form-group">
                        {!! Form::label('name', 'Name:', ['class' => 'col-lg-2 control-label']) !!}
                        <div class="col-lg-9">
                            {!! Form::text('name', null, ['class' => 'form-control', 'placeholder' => 'Name', 'id' => 'edit-name']) !!}
                        </div>
                    </div>

                    <!-- URL -->
                    <div class="form-group">
                        {!! Form::label('url', 'Url:', ['class' => 'col-lg-2 control-label']) !!}
                        <div class="col-lg-9">
                            {!! Form::text('url', null, ['class' => 'form-control', 'placeholder' => 'Url', 'id' => 'edit-url']) !!}
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