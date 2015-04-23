hide_list = ->
  $('.list').hide()

$(document).on('page:load', hide_list)

$(document).on 'click', '.show-list', ->
	$('.list').show();

$(document).on 'click', '.hide-list', ->
	$('.list').hide();


