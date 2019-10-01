Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks',
    sessions: 'users/sessions'
    }

  root 'items#index'

  get 'users/:id/logout', to: 'users#show', as: :user_logout
  get 'users/:id/profile', to: 'users#edit', as: :user_edit
  get 'users/:id/card', to: 'users#edit', as: :user_card_edit
  get 'users/profile', to: 'users#profile', as: :user_profile

  resources :users, only: [:new, :show, :edit, :update, :create_address] do
    resources :user_addresses, only: [:new, :create, :edit, :update]
  end


  resources :items do
    resources :purchase, only: [:index] do
      collection do
        get 'index', to: 'purchase#index'
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
      end
    end
    collection do
      get 'search'
      get 'get_child_categories', defaults: { format: 'json' }
      get 'get_grandchild_categories', defaults: { format: 'json' }
    end
  end

  resources :item_comments, only: :create
  resources :categories, only: [:index, :show]
  resources :brands, only: [:index, :show]
  resources :user_reviewes, only: [:index, :create]


  resources :signup, only: [:index, :create] do

    collection do
      get 'index'
      get 'registration'
      get 'sms_confirmation'
      get 'sms_confirmed'
      get 'delivery_address'
      get 'card'
      get 'done'
    end
  end

  get 'mypage', to: 'mypage/mypage#index', as: :mypage_top

  namespace :mypage do
    get 'listings/listing', to: 'listings#index', as: :listings_listing
    get 'profile', to: 'profile#edit', as: :edit_profile
    patch 'profile', to: 'profile#update', as: :update_profile
    resources :card, only: [:new, :show, :destroy]
    post 'card/new', to: 'card#pay', as: :pay_card
    get 'identification', to: 'identification#edit', as: :edit_identification
    patch 'identification', to: 'identification#update', as: :update_identification
    get 'logout', to: 'logout#logout', as: :mypage_logout
  end

end
