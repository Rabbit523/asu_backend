<div class="modal fade" tabindex="-1" id="show-content-modal" role="dialog" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <fieldset>
                    
                    <!-- Created at -->
                    <div class="form-group row">
                        {!! Form::label('created-at', 'Created at:', ['class' => 'col-lg-6 control-label ']) !!}
                        {!! Form::label('banned-at', 'Banned at:', ['class' => 'col-lg-6 control-label ']) !!}
                        <div class="col-lg-6">
                            <div class="content-created_at"></div>
                        </div>
                        <div class="col-lg-6">
                            <div class="content-banned_at"></div>
                        </div>
                    </div>

                    <!-- Title -->
                    <div class="form-group row">
                        {!! Form::label('title', 'Title:', ['class' => 'col-lg-12 control-label ']) !!}
                        <div class="col-lg-12">
                            <div class="content-title"></div>
                        </div>
                    </div>

                    <!-- Body -->
                    <div class="form-group row">
                        {!! Form::label('body', 'Body:', ['class' => 'col-lg-12 control-label ']) !!}
                        <div class="col-lg-12">
                            <div class="content-body"></div>
                        </div>
                    </div>
                
                </fieldset>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->