<div class="modal fade" tabindex="-1" id="create-modal" role="dialog" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <legend>@lang('messages.new_channel')</legend>
            </div>
            <div class="modal-body padding-x-md padding-y-md">
                {!! Form::open(['class' => 'form-horizontal', 'id' => 'create-form', 'method' => 'POST', 'role'=>'form']) !!}

                <fieldset>
                    
                    <!-- Name -->
                    <div class="form-group">
                        {!! Form::label('name', 'Name:', ['class' => 'col-lg-2 control-label']) !!}
                        <div class="col-lg-9">
                            {!! Form::text('name', null, ['class' => 'form-control', 'placeholder' => 'Name']) !!}
                        </div>
                    </div>
                    
                    <!-- Categories -->
                    <div class="form-group">
                        {!! Form::label('categories', 'Categories', ['class' => 'col-lg-2 control-label'] )  !!}
                        <div class="col-lg-9">
                            {!!  Form::select('categories', $categories,  null, ['class' => 'form-control']) !!}
                        </div>
                    </div>

                    <!-- Tags -->
                    <div class="form-group">
                        {!! Form::label('tags', 'Tags', ['class' => 'col-lg-2 control-label'] )  !!}
                        <div class="col-lg-9">
                            {!!  Form::select('tags[]', [],  null, ['class' => 'form-control', 'multiple']) !!}
                        </div>
                    </div>

                    <!-- Access Type -->
                    <div class="form-group">
                        {!! Form::label('is_public', 'Public ?', ['class' => 'col-lg-2 control-label'] )  !!}
                        <div class="col-lg-1">
                            {!! Form::checkbox('is_public', 1, false, ['class' => 'form-check-input']) !!}
                        </div>
                    </div>

                    <!-- Required? -->
                    <div class="form-group">
                        {!! Form::label('', 'Required ?', ['class' => 'col-lg-2 form-check-input'] )  !!}
                        <div class="col-lg-1">
                            {!! Form::checkbox('required', 1, false, ['class' => 'form-check-input', 'disabled']) !!}
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