json.note do
  json.partial! @note, partial: 'api/notes/note', as: :note
end
