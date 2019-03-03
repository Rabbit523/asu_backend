<div class="modal fade" tabindex="-1" id="create-modal" role="dialog" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <legend>@lang('messages.new_admin')</legend>
            </div>
            <div class="modal-body">
                {!! Form::open(['class' => 'form-horizontal', 'id' => 'create-form', 'method' => 'POST', 'role'=>'form']) !!}

                <fieldset>
                    
                    <!-- Name -->
                    <div class="form-group">
                        {!! Form::label('name', 'Name:', ['class' => 'col-lg-2 control-label']) !!}
                        <div class="col-lg-9">
                            {!! Form::text('name', null, ['class' => 'form-control', 'placeholder' => 'Name', 'id' => 'create-name']) !!}
                        </div>
                    </div>

                    <!-- Email -->
                    <div class="form-group">
                        {!! Form::label('email', 'Email:', ['class' => 'col-lg-2 control-label']) !!}
                        <div class="col-lg-9">
                            {!! Form::email('email', null, ['class' => 'form-control', 'placeholder' => 'Email', 'id' => 'create-email']) !!}
                        </div>
                    </div>
                
                    <!-- Password -->
                    <div class="form-group">
                        {!! Form::label('password', 'Password:', ['class' => 'col-lg-2 control-label']) !!}
                        <div class="col-lg-9">
                            {!! Form::password('password', ['class' => 'form-control', 'placeholder' => 'Password', 'type' => 'password', 'id' => 'create-password']) !!}
                        </div>
                    </div>

                    <!-- Confirm Password -->
                    <div class="form-group">
                        {!! Form::label('password_confirmation', 'Confirm Password:', ['class' => 'col-lg-2 control-label']) !!}
                        <div class="col-lg-9">
                            {!! Form::password('password_confirmation', ['class' => 'form-control', 'placeholder' => 'Password Confirmation', 'type' => 'password', 'id' => 'create-password_confirmation']) !!}
                        </div>
                    </div>
                
                    <!-- Select With One Default -->
                    <div class="form-group">
                        {!! Form::label('select', 'Role', ['class' => 'col-lg-2 control-label'] )  !!}
                        <div class="col-lg-9">
                            {!!  Form::select('role', $roles,  null, ['class' => 'form-control', 'id' => 'create-role' ]) !!}
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