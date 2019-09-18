Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :delivery_addresses => 'users/delivery_addresses',
    :omniauth_callbacks => 'users/omniauth_callbacks'
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

  get 'mypage', to: 'mypage/mypage#index', as: :mypage_top

  namespace :mypage do
    # get 'notification', to: 'notification#index', as: :notification
    # get 'todo', to: 'todo#index', as: :todo
    # get 'like/history', to: 'like#index', as: :like_history
    # get 'listings/listing', to: 'listings#listings', as: :listings_listing
    # get 'listings/in_progress', to: 'listings#in_progress', as: :listings_in_progress
    # get 'listings/completed', to: 'listings#completed', as: :listings_completed
    # get 'purchase', to: 'purchase#index', as: :purchase
    # get 'purchased', to: 'purchased#index', as: :purchased
    # get 'news', to: 'news#index', as: :news
    # get 'review/history', to: 'review#index' as: :review_history
    # get 'support', to: 'support#index', as: :support
    # get 'sales', to: 'sales#index', as: :sales
    # get 'point', to: 'point#index', as: :point

    get 'profile', to: 'profile#edit', as: :edit_profile
    patch 'profile', to: 'profile#update', as: :update_profile
    # get 'delivery_address', to: 'delivery_address#edit', as: :edit_delivery_address
    # patch 'delivery_address', to: 'delivery_address#update', as: :update_delivery_address
    # get 'card', to: 'card#edit', as: :edit_card
    # get 'card', to: 'card#new', as: :new_card
    # post 'card', to: 'card#create', as: :create_card
    # delete 'card', to: 'card#destroy', as: :destroy_card
    # get 'email_password', to: 'email_password#edit', as: :edit_email_password
    # patch 'email_password', to: 'email_password#update', as: :update_email_password
    # get 'identification', to: 'identification#new', as: :new_identification
    # get 'identification', to: 'identification#edit', as: :edit_identification
    # post 'identification', to: 'identification#create', as: :create_identification
    # patch 'identification', to: 'identification#update', as: :update_identification
    # get 'sms_confirmation', to: 'sms_confirmation#show', as: :show_sms_confirmation
    # get 'sms_confirmation', to: 'sms_confirmatipn#new', as: :new_sms_confirmation
    # post 'sms_confirmation', to: 'sms_confirmation#create', as: :create_sms_confirmation
    get 'logout', to: 'logout#logout', as: :mypage_logout
  end

end
