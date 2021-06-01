Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :users, except: [:index, :destroy, :edit, :update] do
    member do
      get :video_request
    end
  end
  resources :categories, only: [:new, :create] do
    resources :videos, only: [:new, :create]
  end
  resources :videos, only: [:edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
