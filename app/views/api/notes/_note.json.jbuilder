json.id           note.id
json.title        note.title
json.body         note.body
json.favorite     note.favorite
json.status       note.status
json.tags do
  json.array!     note.tags, partial: 'api/tags/tag', as: :tag
end
