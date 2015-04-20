json.fold do
  json.partial! @fold, partial: 'api/folds/fold', as: :fold
end
