Rails.application.routes.draw do

  resources :child_notes, except: [:index]

  devise_for :users
  root to: 'notes#index'

  resources :notes do

    resources :checklist_items

    member do
      put 'move_to_position'
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
      resources :assets, only: [:index, :show, :create, :destroy]
    end
    resources :tags, only: [:index, :create, :update, :destroy]
    resource :user, only: [:create, :update, :destroy]
    resource :token, only: [:create]
  end
end
