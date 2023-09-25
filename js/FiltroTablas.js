$(document).ready(function () {
    var theTable = $('table#tabladatos')
    $("#filter").keyup(function () {
        $.uiTableFilter(theTable, this.value);
    })
});