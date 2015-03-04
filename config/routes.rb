Rails.application.routes.draw do
  devise_for :users
  root to: 'notes#index'

  resources :notes do
    member do
      put 'toggle_favorite'
    end
    collection do
      get 'favorites'
    end
  end

  namespace :api, defaults: {format: :json} do
    resources :notes, only: [:index, :show, :create, :update, :destroy]
    resource :token, only: [:create]
  end
end
