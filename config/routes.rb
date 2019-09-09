Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :delivery_addresses => 'users/delivery_addresses',
  }

  root 'items#index'

  resources :users, only: [:show, :new, :create, :edit, :update, :create_address]
  resources :items
  resources :comments, only: :create
  resources :categories, only: :index
  resources :brands, only: :index
  resources :regions, only: :index
  resources :user_reviewes, only: [:index, :create]

end
