Rails.application.routes.draw do
  devise_for :users
  root to: 'trips#index'
  resources :users, only: [:edit, :update]
  resources :trips do
    resources :plans, only: [:create, :destroy] do
      resources :spots, only: [:new, :create, :edit, :update, :destroy]
    end
  end
end
