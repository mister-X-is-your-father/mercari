Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :delivery_addresses => 'users/delivery_addresses',
  }

  root 'items#index'
  get 'mypage/:id', to: 'users#show', as: :mypage
  get 'mypage/:id/logout', to: 'users#show', as: :mypage_logout
  get 'mypage/:id/profile', to: 'users#edit', as: :mypage_edit
  


  resources :users, only: [:show, :edit, :update, :create_address] do
    resources :user_addresses, only: [:new, :create, :edit, :update]
  end
  resources :items
  resources :item_comments, only: :create
  resources :categories, only: [:index, :show]
  resources :brands, only: [:index, :show]
  resources :user_reviewes, only: [:index, :create]

end
