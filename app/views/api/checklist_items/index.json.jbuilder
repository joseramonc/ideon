json.checklist_items do
  json.array! @checklist_items, partial: 'api/checklist_items/checklist_item', as: :checklist_item
end
