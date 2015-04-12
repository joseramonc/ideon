json.asset do
  json.partial! @asset, partial: 'api/assets/asset', as: :asset
end
