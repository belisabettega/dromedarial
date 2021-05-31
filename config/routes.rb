Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, except: [:destroy, :edit, :update]
  resources :categories, only: [:new, :create] do
    resources :videos, only: [:new, :create]
  end
  resources :videos, only: [:edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
