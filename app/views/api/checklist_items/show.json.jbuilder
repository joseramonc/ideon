json.checklist_item do
  json.partial! @checklist_item, partial: 'api/checklist_items/checklist_item', as: :checklist_item
end
