json.tag do
  json.partial! @tag, partial: 'api/tags/tag', as: :tag
end
