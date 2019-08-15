$(document).ready(function(){
  const disabled = document.querySelector('.text-center .disabled');
  if(disabled){
  //disabled.parentNode.remove();
  disabled.closest('.text-center').remove();
}
});