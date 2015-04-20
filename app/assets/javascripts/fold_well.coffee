$(document).on 'click', '.fold-well', ->
  if $(@).data('dirty') == false
    $(@).data('dirty', true)
    $(@).html(
      "
      <div class=\"form-group\">
        <textarea class=\"form-control\">#{$(@).text()}</textarea>
      </div>
      <a class=\"btn btn-primary fold-update\">Actualizar</a>
      "
    )
$(document).on 'click', '.fold-update', ->
  noteId = $(@).parent().data('note-id')
  foldId = $(@).parent().data('fold-id')
  $foldWell = $(@).parent()
  newContent = $foldWell.children('.form-group').children('textarea').val()
  $.ajax
    url: "/notes/#{noteId}/folds/#{foldId}"
    type: 'PUT'
    data:
      fold:
        content: newContent
    success: ->
      $foldWell.data('dirty', true)
      $foldWell.html(newContent)
