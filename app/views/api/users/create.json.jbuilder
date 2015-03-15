json.user do
  json.partial! @user, partial: 'api/users/user', as: :user
end

