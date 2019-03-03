<div class="modal fade" tabindex="-1" id="edit-modal" role="dialog" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <legend>@lang('messages.edit_category')</legend>
            </div>
            <div class="modal-body">
                {!! Form::open(['class' => 'form-horizontal', 'id' => 'edit-form', 'method' => 'PUT', 'role'=>'form']) !!}

                <fieldset>
                    
                    <!-- Name -->
                    <div class="form-group">
                        {!! Form::label('name', 'Name:', ['class' => 'col-lg-2 control-label']) !!}
                        <div class="col-lg-9">
                            {!! Form::text('name', null, ['class' => 'form-control', 'placeholder' => 'Name']) !!}
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
                    <div class="form-group col-lg-9">
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