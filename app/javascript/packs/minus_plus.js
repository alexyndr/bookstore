$(document).ready(function(){
  $('#minus').click(function(e){
    var current_value = $('.quantity-input').val();
    if (current_value >= 2) {
      var new_value = Number(current_value) - 1;
      $('.quantity-input').val(new_value);
    }
  })

  $('#plus').click(function(e){
    var current_value = $('.quantity-input').val();
    if (current_value < 10) {
      var new_value = Number(current_value) + 1;
      $('.quantity-input').val(new_value);
    }
  });
})