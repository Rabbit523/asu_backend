<div class="modal fade" tabindex="-1" id="password-reset-modal" data-show=false role="dialog" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <legend>@lang('adminlte::adminlte.password_reset_message')</legend>
            </div>
            <div class="modal-body">
                {!! Form::open(['class' => 'form-horizontal', 'method' => 'POST', 'role'=>'form', 'id' => 'password-reset-form']) !!}

                <fieldset>

                    <!-- Email -->
                    <div class="form-group">
                        {!! Form::label('email', 'Email:', ['class' => 'col-lg-2 control-label']) !!}
                        <div class="col-lg-9">
                            {!! Form::email('email', null, ['class' => 'form-control', 'placeholder' => 'Email']) !!}
                        </div>
                    </div>

                    <!-- Password -->
                    <div class="form-group">
                        {!! Form::label('password', 'Password:', ['class' => 'col-lg-2 control-label']) !!}
                        <div class="col-lg-9">
                            {!! Form::password('password', ['class' => 'form-control', 'placeholder' => 'Password', 'type' => 'password']) !!}
                        </div>
                    </div>

                    <!-- Confirm Password -->
                    <div class="form-group">
                        {!! Form::label('password_confirmation', 'Confirm Password:', ['class' => 'col-lg-2 control-label']) !!}
                        <div class="col-lg-9">
                            {!! Form::password('password_confirmation', ['class' => 'form-control', 'placeholder' => 'Password Confirmation', 'type' => 'password']) !!}
                        </div>
                    </div>
                
                    <!-- Submit Button -->
                    <div class="form-group">
                        <div class="col-lg-9 col-lg-offset-2">
                            {!! Form::submit(trans('messages.reset'), 
                            ['class' => 'btn btn-md btn-warning pull-right'] ) !!}
                        </div>
                    </div>
                
                </fieldset>
                
                {!! Form::close()  !!}
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->