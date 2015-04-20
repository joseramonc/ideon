json.folds do
  json.array! @folds, partial: 'api/folds/fold', as: :fold
end
