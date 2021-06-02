Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :users, except: [:index, :destroy, :edit, :update]
  resources :categories, only: [:new, :create] do
    resources :videos, only: [:new, :create]
  end
  resources :videos, only: [:edit, :update]
  get 'dashboard', to: 'users#dashboard'
  get 'purchases', to: 'users#purchases'
  get 'change_status/:id', to: 'videos#change_status', as: :change_status
  get 'review/:id', to: 'videos#review', as: :add_review
  patch 'set_review/:id', to: 'videos#set_review', as: :set_review
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
