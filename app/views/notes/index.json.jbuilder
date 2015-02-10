json.array!(@notes) do |note|
  json.extract! note, :id, :title, :body, :favorite, :status
  json.url note_url(note, format: :json)
end
