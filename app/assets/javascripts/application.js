//= require jquery
//= require materialize-sprockets
//= require jquery-ui
//= require foods

$(document).ready(function(){
    $('ul.tabs').tabs('select_tab', 'tab_id');
    $('select').material_select();
  });