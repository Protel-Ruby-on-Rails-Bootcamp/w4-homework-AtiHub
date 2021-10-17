Rails.application.routes.draw do
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  get 'profile/:user_id', to: 'users#profile', as: 'profile'
  resources :articles do
    resources :comments do
      patch :accept, on: :member
    end
  end
  devise_for :users
  root 'home#index'
end
