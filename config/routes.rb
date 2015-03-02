Rails.application.routes.draw do

  devise_for :users
  root to: 'notes#index'

  resources :notes

  namespace :api, defaults: {format: :json} do
    resources :notes, only: [:index, :create, :update, :destroy]
    resource :token, only: [:create]
  end
end
