module NotesHelper
  def icon(note)
    if note.favorite
      'star'
    else
      'star-o'
    end
  end

  def deleted_icon(note)
  	if note.deleted
  		'check'
  	else
  		'close'
  	end
  end

  def icon_text(note)
  	if note.deleted
  		'Reestablecer'
  	else
  		'Eliminar'
  	end
  end
end
