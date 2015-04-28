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
      'trash-o'
    end
  end

  def icon_text(note)
    if note.deleted
      'Reestablecer'
    else
      'Eliminar'
    end
  end

  def rows_for(note)
    if note.body
      note.body.length / 150 + 4
    else
      4
    end
  end
end
