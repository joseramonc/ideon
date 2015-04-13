json.array!(@child_notes) do |child_note|
  json.extract! child_note, :id, :title, :body
  json.url child_note_url(child_note, format: :json)
end
