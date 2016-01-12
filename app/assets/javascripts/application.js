// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery.timepicker.js
//= require vendors
//= require jquery-ui
//= require autocomplete-rails

$(function(){
  $('.vendor_opened_on').datepicker();
  $('.vendor_opened_on_time').timepicker();

  $("#navbar-search-input").autocomplete({
    source: '/vendors/autocomplete.json',
  });

  $('.search-by-name').bind('railsAutocomplete.select', function(event, data {
    $('.fa-search').trigger('click')

  });

  $('.search-query').bind('railsAutocomplete.select', function(event, data){
    window.location.href = '/vendors/' + data.item.id;
  });



  // $('a.fa-search').bind('railsAutocomplete.select', function(event, data){
  //   $('a.fa-search').setAttribute('href', '/vendors/' + data.item.id
  //   alert(data.item.id);
  // });
})
