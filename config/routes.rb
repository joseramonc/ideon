Rails.application.routes.draw do

  resources :child_notes, except: [:index]
  resources :links

  devise_for :users
  root to: 'notes#index'

  resources :notes do

    resources :checklist_items
    resources :folds, only: [:create, :update, :destroy]
    resources :links

    member do
      put 'move_to_position'
      put 'toggle_favorite'
      put 'toggle_deleted'
      put 'delete_asset'
    end

    collection do
      get 'favorites'
      get 'deleted'
    end
  end

  resources :tags



  namespace :api, defaults: { format: :json } do
    resources :notes, only: [:index, :show, :create, :update, :destroy] do
      resources :checklist_items, only: [:index, :show, :create, :update, :destroy]
      resources :assets, only: [:index, :show, :create, :destroy]
      resources :links, only: [:index, :create, :destroy]
      resources :folds, only: [:index, :show, :create, :update, :destroy]
    end
    resources :tags, only: [:index, :create, :update, :destroy]
    resource :user, only: [:create, :update, :destroy]
    resource :token, only: [:create]
  end
end
