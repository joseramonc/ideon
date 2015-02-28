json.notes do
  json.array! @notes do |note|
    json.id           note.id
    json.title        note.title
    json.body         note.body
    json.is_favorite  note.favorite
  end
end
