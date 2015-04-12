json.assets do
  json.array! @assets, partial: 'api/assets/asset', as: :asset
end
