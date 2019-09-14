Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :delivery_addresses => 'users/delivery_addresses',
  }

  root 'items#index'

  resources :users, only: [:new, :show, :edit, :update, :create_address] do
    resources :user_addresses, only: [:new, :create, :edit, :update]
  end
  resources :items
  resources :item_comments, only: :create
  resources :categories, only: [:index, :show]
  resources :brands, only: [:index, :show]
  resources :user_reviewes, only: [:index, :create]

end
