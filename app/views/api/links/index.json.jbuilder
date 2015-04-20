json.links do
  json.array! @links, partial: 'api/links/link', as: :link
end
