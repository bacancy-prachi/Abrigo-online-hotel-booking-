// document.addEventListener("turbolinks:load", function(){

// $('.startDate').datepicker({
// format: 'dd-mm-yyyy',
// autoclose: true,
// startDate: '-d',
// endDate: '+6m'
// }).on('changeDate', function (selected) {
// var minDate = new Date(selected.date.valueOf());
// $('.endDate').datepicker('setStartDate', minDate);
// });

// $(".endDate").datepicker({
// format: 'dd-mm-yyyy',
// autoclose: true,
// endDate: '+6m'
// })
// .on('changeDate', function (selected) {
// var maxDate = new Date(selected.date.valueOf());
// $('.startDate').datepicker('setEndDate', maxDate);
// });
// })
 $(function () {
        $('#datetimepicker6').datetimepicker();
        $('#datetimepicker7').datetimepicker({
            useCurrent: false //Important! See issue #1075
        });
        $("#datetimepicker6").on("dp.change", function (e) {
            $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
        });
        $("#datetimepicker7").on("dp.change", function (e) {
            $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
        });
    });