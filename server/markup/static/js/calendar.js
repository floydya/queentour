$(function () {
  $('#date_range').datepicker({
    range: 'period', // режим - выбор периода
    numberOfMonths: 2,
    onSelect: function (dateText, inst, extensionRange) {
      // extensionRange - объект расширения
      $('#date_range').val(`${extensionRange.startDateText} - ${extensionRange.endDateText}`)
    }
  })
})
