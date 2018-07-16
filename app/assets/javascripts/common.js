$(document).on('turbolinks:load', function () {
    $('.close').click(function () {
        $(this).parent().remove();
    });
});