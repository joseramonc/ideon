change_tag = ->
  $('#tag-select').on 'change', ->
    window.location.href = "#{window.location.pathname}?tag=#{$(@).find(':selected').val()}"

$(document).ready(change_tag)
$(document).on('page:load', change_tag)
