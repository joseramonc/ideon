$(document).on 'click', '#new-image-button', ->
  id = $('#assets-container .form-group').length
  $('#assets-container').append "
    <div class=\"form-group\">
      <input type=\"file\" name=\"note[assets_attributes][#{id}][file]\" id=\"note_assets_attributes_#{id}_file\">
      <input type=\"hidden\" value=\"false\" name=\"note[assets_attributes][#{id}][_destroy]\" id=\"note_assets_attributes_#{id}__destroy\" value=\"0\">
    </div>"
