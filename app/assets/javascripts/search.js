$(document).ready(function() {
  $('.datepicker').datepicker({
    format: 'dd-mm-yyyy'
  });

  $('#select_state').change(function(){
    $.get('/state/'+ $(this).find('option:selected').text() + '/districts', function(data) {
      var options = "<option value>Select from districts</option>";
      $.each(data, function(index, value) {
        options += '<option value"' + value.name + '">'+value.name+'</option>';
      });
      $('#select_district').html(options);
    });
  });

  $('#select_district').change(function(){
    $.get('/district/'+ $(this).find('option:selected').text() + '/markets', function(data) {
      var options = "<option value>Select from markets/mandis</option>";
      $.each(data, function(index, value) {
        options += '<option value"' + value.name + '">'+value.name+'</option>';
      });
      $('#select_market').html(options);
    })

  });

});


