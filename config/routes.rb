Rails.application.routes.draw do

  devise_for :users
  root to: 'notes#index'

  resources :notes do
    member do
      put 'toggle_favorite'
      put 'toggle_deleted'
    end
    collection do
      get 'favorites'
      get 'deleted'
    end
  end

  resources :tags

  namespace :api, defaults: {format: :json} do
    resources :notes, only: [:index, :show, :create, :update, :destroy] do
      resources :checklist_items, only: [:index, :show, :create, :update, :destroy]
    end
    resources :tags, only: [:index, :create, :update, :destroy]
    resource :user, only: [:create, :update, :destroy]
    resource :token, only: [:create]
  end
end
