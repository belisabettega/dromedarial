Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :users, except: [:index, :destroy, :edit, :update] do
    resources :videos, only: [:new]
  end
  resources :categories, only: [:new, :create]
  resources :videos, only: [:edit, :update, :create]
  get 'dashboard', to: 'users#dashboard'
  get 'purchases', to: 'users#purchases'
  get 'change_status/:id', to: 'videos#change_status', as: :change_status
  get 'review/:id', to: 'videos#review', as: :add_review
  patch 'set_review/:id', to: 'videos#set_review', as: :set_review
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
