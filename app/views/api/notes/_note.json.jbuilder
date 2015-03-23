json.id           note.id
json.title        note.title
json.body         note.body
json.favorite     note.favorite
json.deleted      note.deleted
json.tags do
  json.array!     note.tags, partial: 'api/tags/tag', as: :tag
end
json.checklist_items do
  json.array!     note.checklist_items, partial: 'api/checklist_items/checklist_item', as: :checklist_item
end
