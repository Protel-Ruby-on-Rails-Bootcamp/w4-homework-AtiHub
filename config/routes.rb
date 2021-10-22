Rails.application.routes.draw do
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  get 'profile/:user_id', to: 'users#profile', as: 'profile'
  get 'feed/:user_id', to: 'users#feed', as: 'feed'
  resources :articles do
    patch :vote, on: :member
    resources :comments do
      patch :accept, on: :member
      patch :deny, on: :member
    end
  end
  devise_for :users
  resources :relationships, only: [:create, :destroy]
  root 'home#index'
end
