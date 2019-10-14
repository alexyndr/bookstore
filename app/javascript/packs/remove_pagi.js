$(document).ready(function(){
  const disabled = document.querySelector('#div_next_link .disabled');
  if(disabled){
    //disabled.parentNode.remove();
    disabled.closest('.text-center').remove();
  }
});