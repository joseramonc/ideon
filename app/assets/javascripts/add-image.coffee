$(document).on 'click', '#new-image-button', ->
  id = $('#assets-container .form-group').length
  $('#assets-container').append "
    <div class=\"form-group\">
      <input type=\"file\" name=\"note[assets_attributes][#{id}][file]\" id=\"note_assets_attributes_#{id}_file\">
      <input type=\"hidden\" value=\"false\" name=\"note[assets_attributes][#{id}][_destroy]\" id=\"note_assets_attributes_#{id}__destroy\" value=\"0\">
    </div>"

$(document).on 'click', '#new-image-button-child-note', ->
  id = $('#assets-container .form-group').length
  $('#assets-container').append "
    <div class=\"form-group\">
      <input type=\"file\" name=\"child_note[assets_attributes][#{id}][file]\" id=\"child_note_assets_attributes_#{id}_file\">
      <input type=\"hidden\" value=\"false\" name=\"child_note[assets_attributes][#{id}][_destroy]\" id=\"child_note_assets_attributes_#{id}__destroy\" value=\"0\">
    </div>"
