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

$(document).ready(function() {
  $('#project_client_id').change(function(){
     var selected = $(this).find('option:selected');
     var extra = selected.data('foo');

     $('#client_person_name').val(extra.person_name); 
     $('#client_email').val(extra.email); 
     $('#client_cell').val(extra.cell);
     $('#client_fax').val(extra.fax);
  });

  $('#project_staff_id').change(function(){
     var selected = $(this).find('option:selected');
     var extra = selected.data('foo');

     $('#staff_email').val(extra.email); 
     $('#staff_cell').val(extra.cell);
  });
});

$(document).ready(function() {
  $('#project_task_id').change(function(){
    var url = $('#new_project_sub_task').attr('action');
    var obj = url.split('/')
    obj[4] = $(this).find('option:selected').val();
    
    $('#new_project_sub_task').attr('action', obj.join("/"));
  })

  $('#project_sub_task_project_task_id').change(function(){
    $(this).find('option:selected').val();
  })
  
  $('.v_sub_task').click(function(){
     var element = $('[name="project_sub_task[0][name]"').clone();
     var name = element.attr("name");
     var random = Math.floor((Math.random() * 10000) + 1);
     
     element.attr("name", name.replace("0",random))
     $('#repeat-sub-task').append(element);
  });
});

$(document).ready(function() {
  $('.expense_project_id').change(function(){
     var selected = $(this).find('option:selected');
     var tasks = selected.data('tasks');

     $('.expense_project_task_id').empty();
     $('.expense_project_task_id').append($('<option>', { 
        text: 'Select Tasks',
      }));

     $('.expense_project_sub_task_id').empty();
     $('.expense_project_sub_task_id').append($('<option>', { 
        text: 'Select Sub Tasks',
      }));

     $.each(tasks, function(i, v) {
      $('.expense_project_task_id').append($('<option>', { 
        value: v.id,
        text: v.name,
        'data-sub': v.sub_tasks 
      }));
     });
  });

  $('.expense_project_task_id').change(function(){
     var selected = $(this).find('option:selected');
     var sub_tasks = selected.data('sub');

     $('.expense_project_sub_task_id').empty();
     $('.expense_project_sub_task_id').append($('<option>', { 
        text: 'Select Sub Tasks',
      }));

     $.each(sub_tasks, function(i, v) {
      $('.expense_project_sub_task_id').append($('<option>', { 
        value: v.id,
        text: v.name,
      }));
     });
  });
});

$(document).ready(function() {
  $('#expense_project_task_id').change(function(){
     var selected = $(this).find('option:selected');
     var tasks = selected.data('tasks');
     
     $.each(tasks, function(i, v) {
      $('#expense_project_task_id').append($('<option>', { 
        value: v.id,
        text : v.name 
      }));
     });
  });
});

