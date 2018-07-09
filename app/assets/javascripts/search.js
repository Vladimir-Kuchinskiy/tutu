$(document).ready(function(){
    $('.search-form').submit(function(){
        var start_station;
        var end_station;

        start_station = $(this).find('#departure_station_id');
        end_station = $(this).find('#arrival_station_id');

        if (start_station.val() == end_station.val()) {
            alert("Stations can't be the same");
            return false;
        }
    });
});