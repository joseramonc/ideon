module NotesHelper
  def icon(note)
    if note.favorite
      'star'
    else
      'star-o'
    end
  end
end
