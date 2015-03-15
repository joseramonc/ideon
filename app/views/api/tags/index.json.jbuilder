json.tags do
  json.array! @tags, partial: 'api/tags/tag', as: :tag
end
