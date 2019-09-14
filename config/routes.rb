Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :delivery_addresses => 'users/delivery_addresses',
  }

  root 'items#index'

  get 'users/:id/logout', to: 'users#show', as: :user_logout
  get 'users/:id/profile', to: 'users#edit', as: :user_edit
  get 'users/:id/card', to: 'users#edit', as: :user_card_edit
  get 'users/profile', to: 'users#profile', as: :user_profile

  resources :users, only: [:new, :show, :edit, :update, :create_address] do
    resources :user_addresses, only: [:new, :create, :edit, :update]
  end
  resources :items
  resources :item_comments, only: :create
  resources :categories, only: [:index, :show]
  resources :brands, only: [:index, :show]
  resources :user_reviewes, only: [:index, :create]

end
