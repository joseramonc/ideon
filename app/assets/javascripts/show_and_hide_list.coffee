hide_list = ->
  $('.list').hide()

$(document).ready(hide_list)
$(document).on 'click', '.show-list', ->
		$('.list').show();

$(document).on 'click', '.hide-list', ->
		$('.list').hide();


