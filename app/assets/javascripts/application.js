// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery.min
//= require bootstrap/bootstrap.min
//= require nprogress
//= require bootstrap/bootstrap-progressbar.min
//= require custom.min
      

$('#interest_tabs').on('click', 'a[data-toggle="tab"]', function(e) {
  e.preventDefault();

  var $link = $(this);

  if (!$link.parent().hasClass('active')) {
    $('.tab-content:not(.' + $link.attr('href').replace('#','') + ') .tab-pane').removeClass('active');
    $('a[href="' + $link.attr('href') + '_all"][data-toggle="tab"]').click();
    $('.tab-content.' + $link.attr('href').replace('#','') + ' .tab-pane:first').addClass('active');
  }
});

  $(document).ready(function() {
    $('input').on('keyup', function() {
      var inputVal = $(this).val().length

      if (inputVal != 0) {
        $(this).parent().addClass('isActive');
      } else {
        $(this).parent().removeClass('isActive');
      }
    });
  });

$(document).ready(function() {
    $('textarea').on('keyup', function() {
      var inputVal = $(this).val().length

      if (inputVal != 0) {
        $(this).parent().addClass('isActive');
      } else {
        $(this).parent().removeClass('isActive');
      }
    });
  });

