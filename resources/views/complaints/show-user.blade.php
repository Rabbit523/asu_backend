<div class="modal fade" tabindex="-1" id="show-user-modal" role="dialog" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <fieldset>
                    
                    <!-- Name -->
                    <div class="form-group">
                        {!! Form::label('name', 'Name:', ['class' => 'col-lg-4 control-label']) !!}
                        <div class="col-lg-8">
                            {!! Form::text('name', null, ['disabled', 'class' => 'form-control margin-bottom-md', 'placeholder' => 'Name']) !!}
                        </div>
                    </div>

                    <!-- Email -->
                    <div class="form-group">
                        {!! Form::label('email', 'Email:', ['class' => 'col-lg-4 control-label']) !!}
                        <div class="col-lg-8">
                            {!! Form::email('email', null, ['disabled', 'class' => 'form-control margin-bottom-md', 'placeholder' => 'Email']) !!}
                        </div>
                    </div>
                
                    <!-- Graduation Date -->
                    <div class="form-group">
                        {!! Form::label('graduation_date', 'Graduation Date:', ['class' => 'col-lg-4 control-label']) !!}
                        <div class="col-lg-8">
                            {!! Form::text('graduation_date', null, ['disabled', 'class' => 'form-control margin-bottom-md', 'placeholder' => 'Graduation date']) !!}
                        </div>
                    </div>

                    <!-- Student ID -->
                    <div class="form-group">
                        {!! Form::label('student_id', 'Student ID:', ['class' => 'col-lg-4 control-label']) !!}
                        <div class="col-lg-8">
                            {!! Form::text('student_id', null, ['disabled', 'class' => 'form-control margin-bottom-md', 'placeholder' => 'Student ID']) !!}
                        </div>
                    </div>

                    <!-- Major -->
                    <div class="form-group">
                        {!! Form::label('major', 'Major:', ['class' => 'col-lg-4 control-label']) !!}
                        <div class="col-lg-8">
                            {!! Form::text('major', null, ['disabled', 'class' => 'form-control margin-bottom-md', 'placeholder' => 'Major']) !!}
                        </div>
                    </div>

                    <!-- Location -->
                    <div class="form-group">
                        {!! Form::label('location', 'Location:', ['class' => 'col-lg-4 control-label']) !!}
                        <div class="col-lg-8">
                            {!! Form::text('location', null, ['disabled', 'class' => 'form-control margin-bottom-md', 'placeholder' => 'Location']) !!}
                        </div>
                    </div>

                    <!-- Account creation date -->
                    <div class="form-group">
                        {!! Form::label('created_at', 'Account creation date:', ['class' => 'col-lg-4 control-label']) !!}
                        <div class="col-lg-8">
                            {!! Form::text('created_at', null, ['disabled', 'class' => 'form-control margin-bottom-md', 'placeholder' => 'Account creation date']) !!}
                        </div>
                    </div>

                    <!-- Last logged in -->
                    <div class="form-group">
                        {!! Form::label('last_login_at', 'Last logged in:', ['class' => 'col-lg-4 control-label']) !!}
                        <div class="col-lg-8">
                            {!! Form::text('last_login_at', null, ['disabled', 'class' => 'form-control margin-bottom-md', 'placeholder' => 'Last logged in']) !!}
                        </div>
                    </div>
                
                </fieldset>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->