json.id           note.id
json.title        note.title
json.body         note.body
json.favorite     note.favorite
json.deleted      note.deleted
json.position     note.position
json.type         note.type
json.parent_id    note.parent_id
json.tags do
  json.array!     note.tags, partial: 'api/tags/tag', as: :tag
end
json.checklist_items do
  json.array!     note.checklist_items, partial: 'api/checklist_items/checklist_item', as: :checklist_item
end
json.assets do
  json.array!     note.assets, partial: 'api/assets/asset', as: :asset
end
json.folds do
  json.array!     note.folds, partial: 'api/folds/fold', as: :fold
end
json.links do
  json.array!     note.links, partial: 'api/links/link', as: :link
end
json.child_notes do
  json.array!     note.child_notes do |child_note|
    json.id       child_note.id
  end
end
