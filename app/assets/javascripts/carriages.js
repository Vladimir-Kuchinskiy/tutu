$(document).on('turbolinks:load', function() {

    var carriage_type;
    var top_seats = $('.top-seats');
    var bottom_seats = $('.bottom-seats');
    var side_top_seats = $('.side-top-seats');
    var side_bottom_seats = $('.side-bottom-seats');
    var seat_seats = $('.seat-seats');

    carriage_type = $('#carriage_type');

    $('.seats').hide();
    carriageShowByType(carriage_type.val());

    carriage_type.change(function () {
        $('input.seats_number').val('');
        $('.seats').hide();
        carriageShowByType($(this).val());
    });

    function carriageShowByType(type) {
        switch (type) {
            case 'EconomyCarriage':
                top_seats.show();
                bottom_seats.show();
                side_top_seats.show();
                side_bottom_seats.show();
                break;
            case 'CoupeCarriage':
                top_seats.show();
                bottom_seats.show();
                break;
            case 'SvCarriage':
                bottom_seats.show();
                break;
            case 'SeatCarriage':
                seat_seats.show();
                break;
        }
    };

});
