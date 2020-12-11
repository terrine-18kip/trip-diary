Rails.application.routes.draw do
  devise_for :users
  root to: 'trips#index'
  resources :users, only: [:show, :edit, :update]
  resources :trips do
    resources :plans, only: [:create, :edit, :update, :destroy] do
      resources :spots, only: [:new, :create, :edit, :update, :destroy] do
        put :sort
      end
    end
  end
end
