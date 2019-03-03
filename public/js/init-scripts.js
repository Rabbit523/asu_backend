function trans(key, replace = {}) {    
    let translation = key.split('.').reduce((t, i) => t[i] || null, window.translations);
    
    for (let placeholder in replace) {
        translation = translation.replace(`:${placeholder}`, replace[placeholder]);
    }

    return translation;
}

$(document.body).on('click', '.btn-delete-confirm', function (event) {
    event.preventDefault();
    let $form = $(this).closest('form');
    
    swal({
        title: trans('messages.confirm_dialog.title'),
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then(function (willDelete) {
        if (willDelete) {
           $form.submit();
        }
    })
});

$(document.body).on('click', '.btn-block-confirm', function (event) {
    event.preventDefault();

    let link = $(this).attr('href');
    
    swal({
        title: trans('messages.confirm_dialog.title'),
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then(function (willDoIt) {
        if (willDoIt) {
            window.location = link;
        }
    })
});

$(document).ready(function () {
    $('.dt-button').each(function() {
        $(this).removeClass('dt-button').addClass('btn btn-primary btn-sm margin-right-xs');
    })
});
