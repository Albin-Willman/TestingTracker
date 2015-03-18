//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function(){
  $.each($('.js-chosen'), function(){ initChosen($(this)); });
  $('.js-datatable').DataTable();
});

function initChosen($select) {
  var noResultText = $select.attr('data-no-result');
  if (noResultText === undefined) {
    noResultText = "No such records";
  }
  $select.chosen({
    no_results_text: noResultText,
    width: '100%',
    display_disabled_options: false,
    display_selected_options: false
  });
}
