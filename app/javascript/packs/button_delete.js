$(document).ready(function(){
  $('#destroy_confirmation').change(function(e) {
    let destroy_confirmation_button = $('#destroy_confirmation_button')
    if(this.checked) {
      destroy_confirmation_button.removeClass('disabled')
      destroy_confirmation_button.prop('disabled', false)
      $('.checkbox-icon i').addClass('fa fa-check');
    } else {
      destroy_confirmation_button.addClass('disabled')
      destroy_confirmation_button.prop('disabled', true)
      $('.checkbox-icon i').removeClass('fa fa-check');
    } 
  });
});