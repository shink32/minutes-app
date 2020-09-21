Rails.application.routes.draw do
  resources :contents, only: [:index, :new, :create]
  resources :meetings, only: [:index, :new, :create]
  devise_for :users
    root "meetings#index"
  resources :users, only: [:edit, :update]
end
