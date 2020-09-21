Rails.application.routes.draw do
  resources :contents, only: [:index, :new, :create]
  get 'meetings/index'
  devise_for :users
    root "meetings#index"
  resources :users, only: [:edit, :update]
end
